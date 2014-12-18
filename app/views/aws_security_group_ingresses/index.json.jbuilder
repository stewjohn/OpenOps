json.array!(@aws_security_group_ingresses) do |aws_security_group_ingress|
  json.extract! aws_security_group_ingress, :id, :security_group_id, :ingress_id, :ip_protocol, :from_port, :to_port
  json.url aws_security_group_ingress_url(aws_security_group_ingress, format: :json)
end
