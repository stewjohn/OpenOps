class EbsSnapshot < ActiveRecord::Base
  belongs_to :ebs_volume
  belongs_to :aws_account, foreign_key: 'account_number'
  belongs_to :aws_region
  has_many :ebs_snapshot_tags


  def self.latest_snaps(instance_id)
	vols = Instance.volumes(instance_id)
	self.where(volume_id: vols) 
  end
  
  def self.snaps_to_replicate(instance_id,primary_region_id) 
	vols = Instance.volumes(instance_id)
	snaps = Array.new 
	EbsSnapshot.where(aws_region_id: primary_region_id, volume_id: vols, replicated: false).select(:snapshot_id){|s| snaps.push s.snapshot_id}
	return snaps
  end
	


  def self.update_snapshots
    AwsAccount.all.each do |account|
      AwsRegion.all.each do |aws_region |
        creds = Aws::Credentials.new(account.access_key_id, account.secrete_access_key)
        ec2 = Aws::EC2::Client.new(region: aws_region.name, credentials: creds, http_proxy: PROXY)
        ec2.describe_snapshots(:owner_ids => ["#{account.account_number}"]).snapshots.each do | snapshot |
          saved_snapshot = EbsSnapshot.where(snapshot_id: snapshot.snapshot_id).first_or_initialize
          saved_snapshot.aws_account_id = account.account_number
          saved_snapshot.aws_region_id = aws_region.id
          saved_snapshot.volume_id = snapshot.volume_id
          saved_snapshot.state = snapshot.state
          saved_snapshot.start_time = snapshot.start_time
          saved_snapshot.progress = snapshot.progress
          saved_snapshot.owner_id = snapshot.owner_id
          saved_snapshot.description = snapshot.description
          saved_snapshot.volume_size = snapshot.volume_size
          saved_snapshot.encrypted = snapshot.encrypted
          saved_snapshot.save
          puts saved_snapshot.errors.messages
          #
          # Update TAGS
          tag_array = Array.new
          snapshot.tags.each do |tag|
            save_tag = EbsSnapshotTag.where(snapshot_id: snapshot.snapshot_id, key: tag.key).first_or_initialize
            save_tag.value = tag.value
            save_tag.save
            tag_array.push tag.key
          end
          EbsSnapshotTag.where(snapshot_id: snapshot.snapshot_id).where.not(key: tag_array).delete_all
        end
      end
    end
  end
end
