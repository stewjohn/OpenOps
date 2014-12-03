class Host < ActiveRecord::Base
  belongs_to :environment
  belongs_to :sysid
  has_one :instance, primary_key: 'instance_id', foreign_key: 'instance_id'
  has_one :aws_account, through: :environment, primary_key: 'account_number'

  def self.include_all
    self.includes(:environment,:sysid,:instance,:aws_account)
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



end
