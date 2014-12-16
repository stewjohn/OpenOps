class AwsRouteTable < ActiveRecord::Base
belongs_to :aws_account
belongs_to :aws_region
has_many :aws_route_table_associations,  primary_key: 'route_table_id', foreign_key: 'route_table_id'
has_many :aws_route_table_tags,  primary_key: 'route_table_id', foreign_key: 'route_table_id'
has_many :aws_route_table_propogates,  primary_key: 'route_table_id', foreign_key: 'route_table_id'
has_many :aws_route_table_routes, primary_key: 'route_table_id', foreign_key: 'route_table_id'

	def self.update_routes
		AwsAccount.all.each do |account|
			AwsRegion.all.each do |aws_region|
				ec2 = setup_ec2(account.id, aws_region.name)
				rt_array = Array.new
				ec2.describe_route_tables.route_tables.each do | rt |
					saved_rt = AwsRouteTable.where(aws_account_id: account.id, aws_region_id: aws_region.id,  route_table_id: rt.route_table_id).first_or_initialize
					saved_rt.vpc_id = rt.vpc_id
					rt_array.push rt.route_table_id
					#
					# Route Table Associations
					ra_array = Array.new
					rt.associations.each do | ra | 
						saved_ra = AwsRouteTableAssociation.where(route_table_id: rt.route_table_id, route_table_association_id: ra.route_table_association_id).first_or_initialize
						saved_ra.subnet_id = ra.subnet_id 
						saved_ra.main = ra.main
						saved_ra.save
						ra_array.push ra.route_table_association_id
					end
					AwsRouteTableAssociation.where(route_table_id: rt.route_table_id).where.not(route_table_association_id: ra_array).delete_all
					#
					# Route Table Propogation
					rp_array = Array.new
					rt.propagating_vgws.each do | rp | 
						saved_rp = AwsRouteTablePropogate.where(route_table_id: rt.route_table_id, gateway_id: rp.gateway_id).first_or_initialize
						saved_rp.save
						rp_array.push rp.gateway_id
					end
					AwsRouteTablePropogate.where(route_table_id: rt.route_table_id).where.not(gateway_id: rp_array).delete_all
					#
					# Route Table Routes
					rr_array = Array.new
					rt.routes.each do |rr| 
						saved_rr = AwsRouteTableRoute.where(route_table_id: rt.route_table_id, destination_cidr_block: rr.destination_cidr_block).first_or_initialize
						saved_rr.gateway_id = rr.gateway_id 
						saved_rr.instance_id = rr.instance_id
						saved_rr.instance_owner_id = rr.instance_owner_id
						saved_rr.network_interface_id = rr.network_interface_id
						saved_rr.vpc_peering_connection_id = rr.vpc_peering_connection_id
						saved_rr.state = rr.state
						saved_rr.origin = rr.origin
						saved_rr.save
						rr_array.push rr.destination_cidr_block
					end
					AwsRouteTableRoute.where(route_table_id: rt.route_table_id).where.not(destination_cidr_block: rr_array).delete_all
					#
					# update acl tags 
					tag_array = Array.new
					rt.tags.each do |tag|
						save_tag = AwsRouteTableTag.where(route_table_id: rt.route_table_id, key: tag.key).first_or_initialize
						save_tag.value = tag.value
						save_tag.save
						tag_array.push tag.key
					end
					AwsRouteTableTag.where(route_table_id: rt.route_table_id).where.not(key: tag_array).delete_all
				end
				AwsRouteTable.where(aws_account_id: account.id, aws_region_id: aws_region.id).where.not(route_table_id: rt_array).delete_all 
			end
		end 
	end 
end