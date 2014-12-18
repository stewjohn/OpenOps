json.array!(@aws_security_group_tags) do |aws_security_group_tag|
  json.extract! aws_security_group_tag, :id, :security_group_id, :key, :value
  json.url aws_security_group_tag_url(aws_security_group_tag, format: :json)
end
