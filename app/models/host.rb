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
    
      EbsSnapshot.create(snapshot_id: rep.snapshot_id, replicant_of: snapshot.volume_id, replicated: true) 
      EbsSnapshot.where(snapshot_id: snap).update_all(replicated: true) 

      ec2.create_tags(resources: ["#{rep.snapshot_id}"], tags: [{key: "Name", value: "#{host.hostname}"}])
      ec2.create_tags(resources: ["#{rep.snapshot_id}"], tags: [{key: "SYSID", value: "#{host.sysid.name}"}])
      ec2.create_tags(resources: ["#{rep.snapshot_id}"], tags: [{key: "host_id", value: "#{host.id}"}])
    end    

  end 
  
  
  def self.replace_host(host_id)
	host = Host.include_all.find(host_id)
	region = host.instance.availability_zone.chop
	aws_account = AwsAccount.find_by_account_number(host.environment.aws_account_id)
	ec2 = setup_ec2(aws_account.id, region)
	instance_status = ec2.describe_instance_status(instance_ids: [host.instance.instance_id]).instance_statuses.first.instance_state.name
	#
	# Attempt Stop of instance if runnning
	if instance_status == "running"
		sleep 1 until ["stopped"].include?(ec2.stop_instances(instance_ids: [host.instance.instance_id]).stopping_instances.first.currrent_state.name)
	end
	instance_volumes = Instance.volumes(host.instance.instance_id)
	instance_volumes.each do |vol|
		 ec2.detach_volume(instance_id: host.instance.instance_id, volume_id: vol, force: true)
	end
	
  end
  
  
  
end
