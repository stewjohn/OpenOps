json.array!(@aws_network_acls) do |aws_network_acl|
  json.extract! aws_network_acl, :id, :aws_account_id, :aws_region_id, :network_acl_id, :association_id, :association_acl_id, :association_subnet_id
  json.url aws_network_acl_url(aws_network_acl, format: :json)
end
