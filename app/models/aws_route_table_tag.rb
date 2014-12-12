class AwsRouteTableTag < ActiveRecord::Base
belongs_to :aws_route_table, primary_key: 'route_table_id', foreign_key: 'route_table_id'
end
