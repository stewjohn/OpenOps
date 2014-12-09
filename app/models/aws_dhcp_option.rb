class AwsDhcpOption < ActiveRecord::Base

belongs_to :aws_account 
belongs_to :aws_region


	def self.update_options
		AwsAccount.all.each do |account|
			AwsRegion.all.each do |aws_region|
				ec2 = setup_ec2(account.id, aws_region.name)
				dhcp_array = Array.new
				ec2.describe_dhcp_options.dhcp_options.each do | dhcp |
					saved_dhcp = AwsDhcpOption.where(aws_account_id: account.id, aws_region_id: aws_region.id, dhcp_options_id: dhcp.dhcp_options_id).first_or_initialize
					dhcp_array.push dhcp.dhcp_options_id
					saved_dhcp.save
					
					dopt_array = Array.new 
					dhcp.dhcp_configurations.each  do | dopt|
						saved_dopt = AwsDhcpOptionAttribute.where(key: dopt.key, dhcp_options_id: dhcp.dhcp_options_id).first_or_initialize
						saved_dopt.value = dopt.values.first.value 
						saved_dopt.save 
						dopt_array.push dopt.key 
					end 
					AwsDhcpOptionAttribute.where(dhcp_options_id: dhcp.dhcp_options_id).where.not(key: dopt_array).delete_all
				end
				inactive_dhcp_ids = Array.new
				AwsDhcpOption.where(aws_account_id: account.id, aws_region_id: aws_region.id).where.not(dhcp_options_id: dhcp_array).each { |dopt| inactive_dhcp_ids.push dopt.dhcp_options_id}
				AwsDhcpOption.where(dhcp_options_id: inactive_dhcp_ids).delete_all
				AwsDhcpOptionAttribute.where(dhcp_options_id: inactive_dhcp_ids).delete_all
			end
			
		end
	end 


end
