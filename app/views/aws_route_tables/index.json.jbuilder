json.array!(@aws_route_tables) do |aws_route_table|
  json.extract! aws_route_table, :id, :aws_account_id, :aws_region_id, :route_table_id, :vpc_id
  json.url aws_route_table_url(aws_route_table, format: :json)
end
