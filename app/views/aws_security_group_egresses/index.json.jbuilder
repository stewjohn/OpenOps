json.array!(@aws_security_group_egresses) do |aws_security_group_egress|
  json.extract! aws_security_group_egress, :id, :security_group_id, :egress_id, :ip_protocol, :from_port, :to_port
  json.url aws_security_group_egress_url(aws_security_group_egress, format: :json)
end
