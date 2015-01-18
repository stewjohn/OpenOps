json.extract! @aws_security_group_ingress, :id, :security_group_id, :ingress_id, :ip_protocol, :from_port, :to_port, :created_at, :updated_at
