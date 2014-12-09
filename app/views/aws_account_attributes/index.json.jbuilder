json.array!(@aws_account_attributes) do |aws_account_attribute|
  json.extract! aws_account_attribute, :id, :aws_account_id, :attribute_name, :attribute_value
  json.url aws_account_attribute_url(aws_account_attribute, format: :json)
end
