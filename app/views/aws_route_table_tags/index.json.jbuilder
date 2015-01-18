json.array!(@aws_route_table_tags) do |aws_route_table_tag|
  json.extract! aws_route_table_tag, :id, :route_table_id, :key, :value
  json.url aws_route_table_tag_url(aws_route_table_tag, format: :json)
end
