json.array!(@instance_eni_mappings) do |instance_eni_mapping|
  json.extract! instance_eni_mapping, :id, :instance_id, :network_interface_id
  json.url instance_eni_mapping_url(instance_eni_mapping, format: :json)
end
