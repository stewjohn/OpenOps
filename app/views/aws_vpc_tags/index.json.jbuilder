json.array!(@aws_vpc_tags) do |aws_vpc_tag|
  json.extract! aws_vpc_tag, :id, :aws_vpc_id, :name, :value
  json.url aws_vpc_tag_url(aws_vpc_tag, format: :json)
end
