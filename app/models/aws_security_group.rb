class AwsSecurityGroup < ActiveRecord::Base
belongs_to :aws_account
belongs_to :aws_region
has_many :instance_security_group_mappings, primary_key: 'group_id', foreign_key: 'group_id'
has_many :instances, through: :instance_security_group_mappings, primary_key: 'instance_id', foreign_key: 'instance_id'

has_many :aws_security_group_ingresses, foreign_key: 'security_group_id', primary_key: 'group_id'
has_many :aws_security_group_egresses, foreign_key: 'security_group_id', primary_key: 'group_id'
has_many :aws_security_group_ranges, foreign_key: 'security_group_id', primary_key: 'group_id'
has_many :aws_security_group_pairs, foreign_key: 'security_group_id', primary_key: 'group_id'
has_many :aws_security_group_tags, foreign_key: 'security_group_id', primary_key: 'group_id'


	def self.include_all
		self.includes(:aws_security_group_egresses,:aws_security_group_ingresses,:aws_security_group_pairs,:aws_security_group_ranges,:aws_security_group_tags)
	end

	def self.replicate_dr_sg(vpc, dr_vpc_id)
		sg = AwsSecurityGroup.where




	end

	def self.update_groups
		AwsAccount.all.each do |account|
			AwsRegion.all.each do |aws_region|
				ec2 = setup_ec2(account.id, aws_region.name)
				sg_array = Array.new
				ec2.describe_security_groups.security_groups.each do | sg |
				saved_sg = 	AwsSecurityGroup.where(aws_account_id: account.id, aws_region_id: aws_region.id, group_id: sg.group_id).first_or_initialize
				saved_sg.owner_id = sg.owner_id 
				saved_sg.group_name = sg.group_name 
				saved_sg.description = sg.description
				saved_sg.vpc_id = sg.vpc_id
				saved_sg.save 
				sg_array.push sg.group_id 
				#
				# Update Tags 
				tag_array = Array.new
				sg.tags.each do |tag|
					save_tag = AwsSecurityGroupTag.where(security_group_id: sg.group_id, key: tag.key).first_or_initialize
					save_tag.value = tag.value
					save_tag.save
					tag_array.push tag.key
				end
				AwsSecurityGroupTag.where(security_group_id: sg.group_id).where.not(key: tag_array).delete_all
				#
				# Delete Old Rules and IP ranges 
				AwsSecurityGroupIngress.where(security_group_id: sg.group_id).delete_all 
				AwsSecurityGroupEgress.where(security_group_id: sg.group_id).delete_all
				AwsSecurityGroupPair.where(security_group_id: sg.group_id).delete_all
				AwsSecurityGroupRange.where(security_group_id: sg.group_id).delete_all
				#
				# Ingress Set 
				sg.ip_permissions.each do |ig|
					ingress_id = "ig-#{SecureRandom.hex(4)}"
					ingress_set = AwsSecurityGroupIngress.where(security_group_id: sg.group_id, ingress_id: ingress_id).first_or_initialize
					ingress_set.ip_protocol = ig.ip_protocol 
					ingress_set.from_port = ig.from_port 
					ingress_set.to_port = ig.to_port
					ingress_set.save
					ig.user_id_group_pairs.each do |igp|
						AwsSecurityGroupPair.create(security_group_id: sg.group_id, permission_set_id: ingress_id, user_id: igp.user_id, group_name: igp.group_id)
					end
					ig.ip_ranges.each do |ipr|
						AwsSecurityGroupRange.create(security_group_id: sg.group_id, permission_set_id: ingress_id, cidr_ip: ipr.cidr_ip)
					end
				end
				sg.ip_permissions.each do |eg|
					egress_id = "eg-#{SecureRandom.hex(4)}"
					egress_set = AwsSecurityGroupEgress.where(security_group_id: sg.group_id, egress_id: egress_id).first_or_initialize
					egress_set.ip_protocol = eg.ip_protocol 
					egress_set.from_port = eg.from_port 
					egress_set.to_port = eg.to_port
					egress_set.save
					eg.user_id_group_pairs.each do |igp|
						AwsSecurityGroupPair.create(security_group_id: sg.group_id, permission_set_id: egress_id, user_id: igp.user_id, group_name: igp.group_id)
					end
					eg.ip_ranges.each do |ipr|
						AwsSecurityGroupRange.create(security_group_id: sg.group_id, permission_set_id: egress_id, cidr_ip: ipr.cidr_ip)
					end
				end

				end
			end
		end
	end 
end
