json.array!(@aws_azs) do |aws_az|
  json.extract! aws_az, :id, :aws_region_id, :name
  json.url aws_az_url(aws_az, format: :json)
end
