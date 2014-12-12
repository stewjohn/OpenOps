class AwsRouteTablePropogate < ActiveRecord::Base
has_one :aws_route_table, primary_key: 'route_table_id', foreign_key: 'route_table_id'
end
