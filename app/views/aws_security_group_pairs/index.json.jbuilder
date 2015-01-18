json.array!(@aws_security_group_pairs) do |aws_security_group_pair|
  json.extract! aws_security_group_pair, :id, :security_group_id, :permission_set_id, :user_id, :group_name, :group_id
  json.url aws_security_group_pair_url(aws_security_group_pair, format: :json)
end
