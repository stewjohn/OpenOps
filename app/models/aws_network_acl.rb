class AwsNetworkAcl < ActiveRecord::Base
belongs_to :aws_account 
belongs_to :aws_region
has_many :aws_network_acl_entries, primary_key: 'network_acl_id', foreign_key: 'network_acl_id'
has_many :aws_network_acl_tags, primary_key: 'network_acl_id', foreign_key: 'network_acl_id'


	def self.update_acl
		AwsAccount.all.each do |account|
			AwsRegion.all.each do |aws_region|
				ec2 = setup_ec2(account.id, aws_region.name)
				acl_array = Array.new
				ec2.describe_network_acls.network_acls.each do | acl |
					saved_acl = AwsNetworkAcl.where(aws_account_id: account.id, aws_region_id: aws_region.id,  network_acl_id: acl.network_acl_id).first_or_initialize
					saved_acl.vpc_id = acl.vpc_id
					unless acl.associations.first.nil?
						saved_acl.association_id = acl.associations.first.network_acl_association_id
						saved_acl.association_acl_id = acl.associations.first.network_acl_id
						saved_acl.association_subnet_id = acl.associations.first.subnet_id
					end
					saved_acl.save
					acl_array.push acl.network_acl_id
					#
					# update acl entries 
					rule_array = Array.new
					acl.entries.each do |entry|
						saved_entry = AwsNetworkAclEntry.where(network_acl_id: acl.network_acl_id, rule_number: entry.rule_number).first_or_initialize
						saved_entry.protocol = entry.protocol
						saved_entry.rule_action = entry.rule_action
						saved_entry.egress = entry.egress
						saved_entry.cidr_block = entry.cidr_block
						unless entry.icmp_type_code.nil?
							saved_entry.icmp_type_code = entry.icmp_type_code.code
						end
						unless entry.port_range.nil?
							saved_entry.port_range_from = entry.port_range.from
							saved_entry.port_range_to = entry.port_range.to
						end
						saved_entry.save
						rule_array.push entry.rule_number
					end
					AwsNetworkAclEntry.where(network_acl_id: acl.network_acl_id).where.not(rule_number: rule_array).delete_all
					#
					# update acl tags 
					tag_array = Array.new
					acl.tags.each do |tag|
						save_tag = AwsNetworkAclTag.where(network_acl_id: acl.network_acl_id, key: tag.key).first_or_initialize
						save_tag.value = tag.value
						save_tag.save
						tag_array.push tag.key
					end
					AwsNetworkAclTag.where(network_acl_id: acl.network_acl_id).where.not(key: tag_array).delete_all
					
					
					
				end
				AwsNetworkAcl.where(aws_account_id: account.id, aws_region_id: aws_region.id).where.not(network_acl_id: acl_array).delete_all 
			end
		end
	end 
end
