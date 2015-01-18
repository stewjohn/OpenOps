class AwsElasticIp < ActiveRecord::Base
belongs_to :aws_account 
belongs_to :aws_region 
belongs_to :instance, primary_key: 'instance_id', foreign_key: 'instance_id'
belongs_to :instance_eni, primary_key: 'network_interface_id', foreign_key: 'network_interface_id'

	def self.update_eip
		AwsAccount.all.each do |account|
			AwsRegion.all.each do |aws_region|
				creds = Aws::Credentials.new(account.access_key_id, account.secrete_access_key)
				ec2 = Aws::EC2::Client.new(region: aws_region.name, credentials: creds, http_proxy: PROXY)
				ip_array = Array.new
				ec2.describe_addresses.addresses.each do | eip |
					saved_eip = AwsElasticIp.where(aws_account_id: account.id, aws_region_id: aws_region.id, public_ip: eip.public_ip).first_or_initialize 
					saved_eip.instance_id = eip.instance_id
					saved_eip.allocation_id = eip.allocation_id
					saved_eip.association_id = eip.association_id
					saved_eip.domain = eip.domain
					saved_eip.network_interface_id = eip.network_interface_id
					saved_eip.network_interface_owner_id = eip.network_interface_owner_id
					saved_eip.private_ip_address = eip.private_ip_address
					saved_eip.save
					ip_array.push eip.public_ip
				end 
				AwsElasticIp.where(aws_account_id: account.id, aws_region_id: aws_region.id).where.not(public_ip: ip_array).delete_all
			end
		end
	end 


end
