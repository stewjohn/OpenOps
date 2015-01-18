json.array!(@ebs_volumes) do |ebs_volume|
  json.extract! ebs_volume, :id, :aws_account_id, :aws_region_id, :volume_id, :size, :snapshot_id, :availability_zone, :state, :create_time, :volume_type, :iops, :encrypted
  json.url ebs_volume_url(ebs_volume, format: :json)
end
