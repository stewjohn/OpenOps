json.array!(@instance_block_device_mappings) do |instance_block_device_mapping|
  json.extract! instance_block_device_mapping, :id, :instance_id, :device_name, :volume_id
  json.url instance_block_device_mapping_url(instance_block_device_mapping, format: :json)
end
