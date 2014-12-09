json.array!(@aws_internet_gateway_tags) do |aws_internet_gateway_tag|
  json.extract! aws_internet_gateway_tag, :id, :internet_gateway_id, :key, :value
  json.url aws_internet_gateway_tag_url(aws_internet_gateway_tag, format: :json)
end
