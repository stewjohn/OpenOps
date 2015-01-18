json.array!(@aws_regions) do |aws_region|
  json.extract! aws_region, :id, :name
  json.url aws_region_url(aws_region, format: :json)
end
