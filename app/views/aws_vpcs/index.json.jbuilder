json.array!(@aws_vpcs) do |aws_vpc|
  json.extract! aws_vpc, :id, :vpc_id, :state, :cidr_block, :dhcp_options_id, :instance_default, :is_default
  json.url aws_vpc_url(aws_vpc, format: :json)
end
