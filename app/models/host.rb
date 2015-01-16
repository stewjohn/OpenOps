class Host < ActiveRecord::Base
  belongs_to :environment
  belongs_to :sysid
  has_one :instance, primary_key: 'instance_id', foreign_key: 'instance_id'
 # has_one :aws_account, through: :environment, primary_key: 'account_number'

  def self.include_all
    self.includes(:environment,:sysid,:instance)
  end

  def self.dr_replicate(host_id) 
    host = self.include_all.find(host_id)
    primary_vpc = AwsVpc.includes(:aws_region).find_by_vpc_id(host.environment.primary_vpc_id)
    dr_vpc = AwsVpc.includes(:aws_region).find_by_vpc_id(host.environment.dr_vpc_id)
    snaps_to_replicate = EbsSnapshot.snaps_to_replicate(host.instance_id, primary_vpc.aws_region_id)
    creds = Aws::Credentials.new(host.aws_account.access_key_id, host.aws_account.secrete_access_key)
    ec2 = Aws::EC2::Client.new(region: dr_vpc.aws_region.name, credentials: creds, http_proxy: PROXY)
    
    snaps_to_replicate.each do |snap|
    snapshot = EbsSnapshot.find_by_snapshot_id(snap)
    rep = ec2.copy_snapshot(source_region: primary_vpc.aws_region.name,
                        source_snapshot_id: snap,
                        description: "This is a replicated DR Snapshot of #{host.hostname}", 
                        destination_region: dr_vpc.aws_region.name)
    
      EbsSnapshot.create(snapshot_id: rep.snapshot_id, replicant_of: snapshot.volume_id, replicated: true) 
      EbsSnapshot.where(snapshot_id: snap).update_all(replicated: true) 

      ec2.create_tags(resources: ["#{rep.snapshot_id}"], tags: [{key: "Name", value: "#{host.hostname}"}])
      ec2.create_tags(resources: ["#{rep.snapshot_id}"], tags: [{key: "SYSID", value: "#{host.sysid.name}"}])
      ec2.create_tags(resources: ["#{rep.snapshot_id}"], tags: [{key: "host_id", value: "#{host.id}"}])
    end    

  end 
  
  
  def self.replace_host(host_id)
	host = Host.include_all.find(host_id)
	instance = host.instance
	region = host.instance.availability_zone.chop
	aws_account = AwsAccount.find_by_account_number(host.environment.aws_account_id)
	ec2 = setup_ec2(aws_account.id, region)
	begin 
		instance_status = ec2.describe_instance_status(instance_ids: [host.instance.instance_id]).instance_statuses.first.instance_state.name
	rescue 
		puts "instance is not running, or terminated"
	end
	eni = InstanceEniMapping.where(instance_id: host.instance.instance_id)
	eni_attachment_id = InstanceEni.find_by_network_interface_id(eni.first.network_interface_id).attachment_id
	security_group = InstanceSecurityGroupMapping.where(instance_id: instance.instance_id).first.group_id

	
	# build mapping of drives 
	###
	instance_volumes = Hash.new
	InstanceBlockDeviceMapping.where(instance_id: host.instance.instance_id).each do |map| 
		instance_volumes["#{map.device_name}"] = map.volume_id
	end
	#
	# Attempt Stop of instance if runnning
	if instance_status == "running"
		sleep 1 until ["stopped"].include?(ec2.stop_instances(instance_ids: [host.instance.instance_id]).stopping_instances.first.current_state.name)
	end
	
	instance_volumes.each do |mount,vol|
		 ec2.detach_volume(instance_id: host.instance.instance_id, volume_id: vol, force: true)
	end
	sleep 1 until ["terminated"].include?(ec2.terminate_instances(instance_ids: [host.instance.instance_id]).terminating_instances.first.current_state.name)
	sleep 5
	begin 
		ec2.delete_network_interface(network_interface_id: eni.first.network_interface_id)
	rescue 
		puts "ENI already Deleted"
	end
	sleep 5
	resp = Instance.create_instance(aws_account.id, instance.availability_zone,instance.instance_type,instance.key_name,security_group,instance.subnet_id,instance.private_ip_address)
	h = Host.find(host.id)
	h.instance_id = resp.instances.first.instance_id
	h.save
	instance.instance_id = resp.instances.first.instance_id
	instance.save
	host.reload
	puts "waiting 30secs"
	sleep 30
	puts "wait for run"
	begin
		sleep 1 until ["running"].include?(ec2.describe_instance_status(instance_ids: [instance.instance_id]).instance_statuses.first.instance_state.name)
	rescue 
		puts "data is lagging, assuming running and continuing" 
	end 
	sleep 1 until ["stopped"].include?(ec2.stop_instances(instance_ids: [host.instance.instance_id]).stopping_instances.first.current_state.name)
	base_vol =  ec2.describe_instances(instance_ids: [host.instance.instance_id]).reservations.first.instances.first.block_device_mappings.first.ebs.volume_id
	ec2.detach_volume(instance_id: host.instance.instance_id, volume_id: base_vol, force: true)
	sleep 5 
	ec2.delete_volume(volume_id: base_vol)
	
	instance_volumes.each do |mount,vol|
		 ec2.attach_volume(instance_id: host.instance.instance_id, volume_id: vol, device: mount)
	end
	Instance.add_update_tag(host.instance_id,"Name",host.hostname)
	Instance.add_update_tag(host.instance_id,"SYSID",host.sysid.name)
	Instance.update_instances
    Instance.update_volume_tags(host.instance_id,"Name",host.hostname)
    Instance.update_volume_tags(host.instance_id,"SYSID",host.sysid.name)
	Instance.update_volume_tags(host.instance_id,"host_id",host.id)
	ec2.start_instances(instance_ids: [instance.instance_id])
	
  end
  
  
  
end
