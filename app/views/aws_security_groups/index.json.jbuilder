json.array!(@aws_security_groups) do |aws_security_group|
  json.extract! aws_security_group, :id, :owner_id, :group_name, :group_id, :description
  json.url aws_security_group_url(aws_security_group, format: :json)
end
