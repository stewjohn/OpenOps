json.extract! @aws_network_acl_entry, :id, :network_acl_id, :rule_number, :protocol, :rule_action, :egress, :cidr_block, :icmp_type_code, :port_range_from, :port_range_to, :created_at, :updated_at
