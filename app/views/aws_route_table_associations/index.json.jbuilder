json.array!(@aws_route_table_associations) do |aws_route_table_association|
  json.extract! aws_route_table_association, :id, :route_table_id, :route_table_association_id, :route_table_id, :subnet_id, :main
  json.url aws_route_table_association_url(aws_route_table_association, format: :json)
end
