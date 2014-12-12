json.array!(@aws_route_table_propogates) do |aws_route_table_propogate|
  json.extract! aws_route_table_propogate, :id, :route_table_id, :gateway_id
  json.url aws_route_table_propogate_url(aws_route_table_propogate, format: :json)
end
