json.array!(@aws_subnets) do |aws_subnet|
  json.extract! aws_subnet, :id, :subnet_id, :state, :vpc_id, :cidr_block, :available_ip_address_count, :availability_zone, :default_for_az, :map_public_ip_on_launch
  json.url aws_subnet_url(aws_subnet, format: :json)
end
