class AwsKeyPair < ActiveRecord::Base
belongs_to :aws_account 
belongs_to :aws_region

has_many :instances, primary_key: "key_name", foreign_key: 'key_name'

def self.update_keys
	AwsAccount.all.each do |account|
		AwsRegion.all.each do |aws_region|
			ec2 = setup_ec2(account.id, aws_region.name)
			kp_array = Array.new
			ec2.describe_key_pairs.key_pairs.each do | kp |
				saved_kp = AwsKeyPair.where(aws_account_id: account.id, aws_region_id: aws_region.id, key_name: kp.key_name).first_or_initialize
				saved_kp.key_fingerprint = kp.key_fingerprint
				saved_kp.save
				kp_array.push kp.key_name
			end
			AwsKeyPair.where(aws_account_id: account.id, aws_region_id: aws_region.id).where.not(key_name: kp_array).delete_all
		end
		
	end
end 




end
