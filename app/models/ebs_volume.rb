class EbsVolume < ActiveRecord::Base
  belongs_to :aws_account, foreign_key: 'account_number'
  belongs_to :aws_region
  has_many :ebs_snapshots, primary_key: 'volume_id', foreign_key: 'volume_id'
  has_many :instance_block_device_mapping,primary_key: 'volume_id', foreign_key: 'volume_id'


  def self.create_snaps(host_id)
	host = Host.include_all.find(host_id)
	env = Environment.joins(:aws_account).find(host.environment_id)
	instance = Instance.joins(:aws_region).find_by_instance_id(host.instance_id) 
	vols = Instance.volumes(host.instance_id)
	creds = Aws::Credentials.new(env.aws_account.access_key_id, env.aws_account.secrete_access_key)
        ec2 = Aws::EC2::Client.new(region: instance.aws_region.name, credentials: creds, http_proxy: PROXY)
	vols.each do |vol| 
		snap = ec2.create_snapshot(volume_id: vol)
		EbsSnapshot.create(snapshot_id: snap.snapshot_id, volume_id: snap.volume_id, state: snap.state, 
				   start_time: snap.start_time, progress: 0, owner_id: snap.owner_id, description: snap.description,
				   volume_size: snap.volume_size, encrypted: snap.encrypted, replicated: false)

        	ec2.create_tags(resources: ["#{snap.snapshot_id}"], tags: [{key: "Name", value: "#{host.hostname}"}])
	        ec2.create_tags(resources: ["#{snap.snapshot_id}"], tags: [{key: "SYSID", value: "#{host.sysid.name}"}])
        	ec2.create_tags(resources: ["#{snap.snapshot_id}"], tags: [{key: "host_id", value: "#{host.id}"}])
	end
  host.last_checkpoint = Time.now.utc
  host.save 
  end

  def self.update_volumes
    AwsAccount.all.each do |account|
      AwsRegion.all.each do |aws_region|
        creds = Aws::Credentials.new(account.access_key_id, account.secrete_access_key)
        ec2 = Aws::EC2::Client.new(region: aws_region.name, credentials: creds, http_proxy: PROXY)
        ec2.describe_volumes.volumes.each do | volume |
          saved_volume = EbsVolume.where(volume_id: volume.volume_id).first_or_initialize
          saved_volume.aws_account_id = account.account_number
          saved_volume.aws_region_id =  aws_region.id
          saved_volume.size = volume.size
          saved_volume.snapshot_id = volume.snapshot_id
          saved_volume.availability_zone = volume.availability_zone
          saved_volume.state = volume.state
          saved_volume.create_time = volume.create_time
          saved_volume.volume_type = volume.volume_type
          saved_volume.iops = volume.iops
          saved_volume.encrypted = volume.encrypted
          saved_volume.save
          puts saved_volume.errors.messages
          #
          # Update TAGS
          tag_array = Array.new
           volume.tags.each do |tag|
            save_tag = EbsVolumeTag.where(volume_id: volume.volume_id, key: tag.key).first_or_initialize
            save_tag.value = tag.value
            save_tag.save
            tag_array.push tag.key
          end
          EbsVolumeTag.where(volume_id: volume.volume_id).where.not(key: tag_array).delete_all
        end
      end
    end
  end


end
