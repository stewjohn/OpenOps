json.array!(@aws_network_acl_tags) do |aws_network_acl_tag|
  json.extract! aws_network_acl_tag, :id, :network_acl_id, :key, :value
  json.url aws_network_acl_tag_url(aws_network_acl_tag, format: :json)
end
