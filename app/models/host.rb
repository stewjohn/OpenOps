class Host < ActiveRecord::Base
  belongs_to :environment
  belongs_to :sysid
  has_one :instance, primary_key: 'instance_id', foreign_key: 'instance_id'
  has_one :aws_account, through: :environment, primary_key: 'account_number'

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
		unless rep.snapshot_id.nil?
				EbsSnapshot.create(snapshot_id: rep.snapshot_id, replicant_of: snapshot.volume_id, replicated: true)
				EbsSnapshot.where(snapshot_id: snap).update_all(replicated: true)

				ec2.create_tags(resources: ["#{rep.snapshot_id}"], tags: [{key: "Name", value: "#{host.hostname}"}])
				ec2.create_tags(resources: ["#{rep.snapshot_id}"], tags: [{key: "SYSID", value: "#{host.sysid.name}"}])
				ec2.create_tags(resources: ["#{rep.snapshot_id}"], tags: [{key: "host_id", value: "#{host.id}"}])
			end
		end
  end 



	def self.recover_to_dr(host_id)
		host = Host.include_all.find(host_id)
		instance = host.instance
		region = host.instance.availability_zone.chop
		dr_region = AwsVpc.with_region.find_by_vpc_id(host.environment.dr_vpc_id).aws_region.name
		aws_account = AwsAccount.find_by_account_number(host.environment.aws_account_id)
		ec2 = setup_ec2(aws_account.id, region)
		dr_ec2 = setup_ec2(aws_account.id, dr_region)
		begin
			instance_status = dr_ec2.describe_instance_status(instance_ids: [host.dr_instance_id]).instance_statuses.first.instance_state.name
		rescue
			Rails.logger.debug "Instance is not running, terminated, or instance metadata expired"
			instance_status = "Terminated"
		end

		if !instance_status=="Terminated"
			dr_ec2.terminate_instances(instance_ids: [host.dr_instance_id])
			dr_ec2.wait_until(:instance_terminated, instance_ids: [host.dr_instance_id])
		end

		if host.instance.virtualization_type == "hvm"
		  image_id = "ami-b5a7ea85"
		else
			image_id = "ami-55a7ea65"
		end

		cidr = NetAddr::CIDR.create(AwsSubnet.find_by_subnet_id(host.instance.subnet_id).cidr_block)
		subnet = AwsSubnet.where(cidr_block: "#{cidr.base + cidr.netmask}").where.not(subnet_id: host.instance.subnet_id)
		security_group = host.environment.dr_security_group_id
		instance_volumes = Instance.restore_map(instance.instance_id)
		resp = Instance.create_instance(aws_account.id, subnet.first.availability_zone,instance.instance_type,instance.key_name,security_group,subnet.first.subnet_id,instance.private_ip_address,image_id)
		sleep 10
		host.dr_instance_id =  resp.instances.first.instance_id
		host.save
		dr_ec2.wait_until(:instance_running, instance_ids: [host.dr_instance_id])
		dr_ec2.stop_instances(instance_ids: [host.dr_instance_id])
		dr_ec2.wait_until(:instance_stopped, instance_ids: [host.dr_instance_id])
		base_vol =  dr_ec2.describe_instances(instance_ids: [host.dr_instance_id]).reservations.first.instances.first.block_device_mappings.first.ebs.volume_id
		dr_ec2.detach_volume(instance_id: host.dr_instance_id, volume_id: base_vol, force: true)
		dr_ec2.wait_until(:volume_available, volume_ids: [base_vol])
		dr_ec2.delete_volume(volume_id: base_vol)
		instance_volumes.each do |mount,snapshot|
			snap = EbsSnapshot.find_by_snapshot_id(snapshot)
			orig_vol = EbsVolume.find_by_volume_id(snap.replicant_of)
			dr_vol = dr_ec2.create_volume(size: orig_vol.size, snapshot_id: snapshot, availability_zone: subnet.first.availability_zone, volume_type: orig_vol.volume_type)
			dr_ec2.wait_until(:volume_available, volume_ids: [dr_vol.volume_id])
			dr_ec2.attach_volume(instance_id: host.dr_instance_id, volume_id: dr_vol.volume_id, device: mount)
			dr_ec2.wait_until(:volume_in_use, volume_ids: [dr_vol.volume_id])
		end
		dr_ec2.start_instances(instance_ids: [host.dr_instance_id])
		sleep 30
		Instance.update_instances
		Instance.tag_resources(host.dr_instance_id)
	end


  def self.replace_host(host_id)
		host = Host.include_all.find(host_id)
		instance = host.instance
		region = host.instance.availability_zone.chop
		aws_account = AwsAccount.find_by_account_number(host.environment.aws_account_id)
		ec2 = setup_ec2(aws_account.id, region)
		begin
			instance_status = ec2.describe_instance_status(instance_ids: [host.instance.instance_id]).instance_statuses.first.instance_state.name
			eni = InstanceEniMapping.where(instance_id: host.instance.instance_id)
			eni_attachment_id = InstanceEni.find_by_network_interface_id(eni.first.network_interface_id).attachment_id
			security_group = InstanceSecurityGroupMapping.where(instance_id: instance.instance_id).first.group_id
		rescue
			puts "instance is not running, or terminated"
		end
		# build mapping of drives
		###
		instance_volumes = Instance.mount_map(instance.instance_id)
		ec2.stop_instances(instance_ids: [host.instance.instance_id])
		ec2.wait_until(:instance_stopped, instance_ids: [host.instance.instance_id])
		instance_volumes.each do |mount,vol|
			 ec2.detach_volume(instance_id: host.instance.instance_id, volume_id: vol, force: true)
		end
		ec2.terminate_instances(instance_ids: [host.instance.instance_id])
		ec2.wait_until(:instance_terminated, instance_ids: [host.instance.instance_id])
		begin
			ec2.delete_network_interface(network_interface_id: eni.first.network_interface_id)
		rescue
			puts "ENI already Deleted"
		end
		sleep 5
		resp = Instance.create_instance(aws_account.id, instance.availability_zone,instance.instance_type,instance.key_name,security_group,instance.subnet_id,instance.private_ip_address,instance.image_id)
		h = Host.find(host.id)
		h.instance_id = resp.instances.first.instance_id
		h.save
		instance.instance_id = resp.instances.first.instance_id
		instance.save
		host.reload
		ec2.wait_until(:instance_running, instance_ids: [host.instance.instance_id])
		ec2.stop_instances(instance_ids: [host.instance.instance_id])
		ec2.wait_until(:instance_stopped, instance_ids: [host.instance.instance_id])
		base_vol =  ec2.describe_instances(instance_ids: [host.instance.instance_id]).reservations.first.instances.first.block_device_mappings.first.ebs.volume_id
		ec2.detach_volume(instance_id: host.instance.instance_id, volume_id: base_vol, force: true)
		ec2.wait_until(:volume_available, volume_ids: [base_vol])
		ec2.delete_volume(volume_id: base_vol)
		begin
		ec2.wait_until(:volume_deleted, volume_ids: [base_vol])
		rescue
			Rails.logger.debug "Volumes Data already Deleted"
		end
		instance_volumes.each do |mount,vol|
			 ec2.attach_volume(instance_id: host.instance.instance_id, volume_id: vol, device: mount)
		end
		ec2.start_instances(instance_ids: [instance.instance_id])
		sleep 30
		Instance.update_instances
		Instance.tag_resources(instance.instance_id)
  end
  
  
  
end
