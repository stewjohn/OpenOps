json.array!(@aws_security_group_ranges) do |aws_security_group_range|
  json.extract! aws_security_group_range, :id, :security_group_id, :permission_set_id, :cidr_ip
  json.url aws_security_group_range_url(aws_security_group_range, format: :json)
end
