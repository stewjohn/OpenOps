json.array!(@instance_security_group_mappings) do |instance_security_group_mapping|
  json.extract! instance_security_group_mapping, :id, :instance_id, :group_id
  json.url instance_security_group_mapping_url(instance_security_group_mapping, format: :json)
end
