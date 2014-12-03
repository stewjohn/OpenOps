json.array!(@ebs_snapshots) do |ebs_snapshot|
  json.extract! ebs_snapshot, :id, :aws_account_id, :aws_region_id, :snapshot_id, :volume_id, :state, :start_time, :progress, :owner_id, :description, :volume_size, :encrypted, :replicated
  json.url ebs_snapshot_url(ebs_snapshot, format: :json)
end
