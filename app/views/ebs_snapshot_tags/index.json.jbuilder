json.array!(@ebs_snapshot_tags) do |ebs_snapshot_tag|
  json.extract! ebs_snapshot_tag, :id, :snapshot_id, :key, :value
  json.url ebs_snapshot_tag_url(ebs_snapshot_tag, format: :json)
end
