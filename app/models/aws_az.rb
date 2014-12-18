class AwsAz < ActiveRecord::Base
belongs_to :aws_region 
has_many :aws_subnets, primary_key: 'name', foreign_key: 'availability_zone'
	def self.update_az
			AwsAccount.all.each do |account|
				AwsRegion.all.each do |aws_region|
					creds = Aws::Credentials.new(account.access_key_id, account.secrete_access_key)
					ec2 = Aws::EC2::Client.new(region: aws_region.name, credentials: creds, http_proxy: PROXY)
					ec2.describe_availability_zones.availability_zones.each do | az |
						saved_az = AwsAz.where(aws_region_id: aws_region.id, name: az.zone_name).first_or_initialize 
						saved_az.state = az.state 
						saved_az.save
					end 
				end
			end
		end 
end
