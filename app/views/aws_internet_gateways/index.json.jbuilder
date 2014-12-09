json.array!(@aws_internet_gateways) do |aws_internet_gateway|
  json.extract! aws_internet_gateway, :id, :aws_account_id, :aws_region_id, :internet_gateway_id, :attachment_vpc_id, :attachment_state
  json.url aws_internet_gateway_url(aws_internet_gateway, format: :json)
end
