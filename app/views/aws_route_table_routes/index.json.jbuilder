json.array!(@aws_route_table_routes) do |aws_route_table_route|
  json.extract! aws_route_table_route, :id, :route_table_id, :destination_cidr_block, :gateway_id, :instance_id, :instance_owner_id, :network_interface_id, :vpc_peering_connection_id, :state, :origin
  json.url aws_route_table_route_url(aws_route_table_route, format: :json)
end
