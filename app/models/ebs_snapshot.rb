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
	
	
	def self.clean_up_snapshots_for_env(env_id)
		env  = Environment.with_all.all
		env.each do |enviro|
			enviro.hosts.each  do | h |
				snaps = Array.new
				dr_snaps = Array.new
				host = Host.include_all.find(h.id)
				vols = Instance.volumes(host.instance_id)
				
				primary_vpc = AwsVpc.includes(:aws_region).find_by_vpc_id(host.environment.primary_vpc_id)
				dr_vpc = AwsVpc.includes(:aws_region).find_by_vpc_id(host.environment.dr_vpc_id)
				
				EbsSnapshot.where(replicant_of: vols).where("created_at < '#{Time.now.utc - enviro.backup_retention.days}'").select(:snapshot_id){|s| dr_snaps.push s.snapshot_id}
				EbsSnapshot.where(volume_id: vols).where("created_at < '#{Time.now.utc - enviro.backup_retention.days}'").select(:snapshot_id){|s| snaps.push s.snapshot_id}
				
				 creds = Aws::Credentials.new(enviro.aws_account.access_key_id, enviro.aws_account.secrete_access_key)
                 ec2 = Aws::EC2::Client.new(region: primary_vpc.aws_region.name, credentials: creds, http_proxy: PROXY)
				 dr_ec2 = Aws::EC2::Client.new(region: dr_vpc.aws_region.name, credentials: creds, http_proxy: PROXY)
				
				snaps.each  do | snap |
					begin 
						ec2.delete_snapshot(snapshot_id: snap)
					rescue 
					
					end
				end
				
				dr_snaps.each  do | snap |
					begin
						dr_ec2.delete_snapshot(snapshot_id: snap)
					rescue 
					 
					end
				end
				
				EbsSnapshot.where(snapshot_id: snaps).update_all(state: "Deleted") 
				EbsSnapshot.where(snapshot_id: dr_snaps).update_all(state: "Deleted") 				
			end 
		end	
	end

  def self.update_snapshots
    AwsAccount.all.each do |account|
      AwsRegion.all.each do |aws_region |
        ec2 = setup_ec2(account.id, aws_region.name)
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
