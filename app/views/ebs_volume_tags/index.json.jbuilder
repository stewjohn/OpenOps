json.array!(@ebs_volume_tags) do |ebs_volume_tag|
  json.extract! ebs_volume_tag, :id, :volume_id, :key, :value
  json.url ebs_volume_tag_url(ebs_volume_tag, format: :json)
end
