json.array!(@aws_network_acl_entries) do |aws_network_acl_entry|
  json.extract! aws_network_acl_entry, :id, :network_acl_id, :rule_number, :protocol, :rule_action, :egress, :cidr_block, :icmp_type_code, :port_range_from, :port_range_to
  json.url aws_network_acl_entry_url(aws_network_acl_entry, format: :json)
end
