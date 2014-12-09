class AwsAccountAttribute < ActiveRecord::Base
belongs_to :aws_account 
belongs_to :aws_region 

	def self.update_attr
		AwsAccount.all.each do |account|
			AwsRegion.all.each do |aws_region|
				creds = Aws::Credentials.new(account.access_key_id, account.secrete_access_key)
				ec2 = Aws::EC2::Client.new(region: aws_region.name, credentials: creds, http_proxy: PROXY)
				ec2.describe_account_attributes.account_attributes.each do | attr |
					saved_attr = AwsAccountAttribute.where(aws_account_id: account.id, aws_region_id: aws_region.id, attribute_name: attr.attribute_name).first_or_initialize 
					saved_attr.attribute_value = attr.attribute_values.first.attribute_value
					saved_attr.save
				end 
			end
		end
	end 
end
