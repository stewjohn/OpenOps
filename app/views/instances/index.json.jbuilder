json.array!(@instances) do |instance|
  json.extract! instance, :id, :host_id, :instance_id, :owner_id, :state_code, :state, :key_name, :monitoring, :instance_type
  json.url instance_url(instance, format: :json)
end
