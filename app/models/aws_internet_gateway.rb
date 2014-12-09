class AwsInternetGateway < ActiveRecord::Base
belongs_to :aws_account
belongs_to :aws_region 

def self.update_gw
		AwsAccount.all.each do |account|
			AwsRegion.all.each do |aws_region|
				ec2 = setup_ec2(account.id, aws_region.name)
				gw_array = Array.new
				ec2.describe_internet_gateways.internet_gateways.each do | gw |
					saved_gw = AwsInternetGateway.where(aws_account_id: account.id, aws_region_id: aws_region.id, internet_gateway_id: gw.internet_gateway_id ).first_or_initialize
					saved_gw.attachment_vpc_id = gw.attachments[0].vpc_id
					saved_gw.attachment_state = gw.attachments[0].state
					saved_gw.save
					gw_array.push gw.internet_gateway_id
					#
					# Update TAGS
					tag_array = Array.new
					gw.tags do |tag|
						save_tag = AwsInternetGatewayTag.where(internet_gateway_id: gw.internet_gateway_id, key: tag.key).first_or_initialize
						save_tag.value = tag.value
						save_tag.save
						tag_array.push tag.key
					end
					AwsInternetGatewayTag.where(internet_gateway_id: gw.internet_gateway_id).where.not(key: tag_array).delete_all
				end
				AwsInternetGateway.where(aws_account_id: account.id, aws_region_id: aws_region.id).where.not(internet_gateway_id: gw_array).delete_all
			end
			
		end
	end 



end
