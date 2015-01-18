json.array!(@instance_tags) do |instance_tag|
  json.extract! instance_tag, :id, :instance_id, :name, :value
  json.url instance_tag_url(instance_tag, format: :json)
end
