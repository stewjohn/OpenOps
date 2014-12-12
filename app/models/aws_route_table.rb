class AwsRouteTable < ActiveRecord::Base
belongs_to :aws_account
belongs_to :aws_region
has_many :aws_route_table_associations,  primary_key: 'route_table_id', foreign_key: 'route_table_id'
has_many :aws_route_table_tags,  primary_key: 'route_table_id', foreign_key: 'route_table_id'
has_many :aws_route_table_propogates,  primary_key: 'route_table_id', foreign_key: 'route_table_id'
has_many :aws_route_table_routes, primary_key: 'route_table_id', foreign_key: 'route_table_id'

 def self.update_routes
 
	
 
 
 
 end 








end
