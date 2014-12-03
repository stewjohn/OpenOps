json.array!(@instance_eni_tags) do |instance_eni_tag|
  json.extract! instance_eni_tag, :id, :instance_id, :key, :value
  json.url instance_eni_tag_url(instance_eni_tag, format: :json)
end
