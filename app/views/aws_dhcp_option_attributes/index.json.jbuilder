json.array!(@aws_dhcp_option_attributes) do |aws_dhcp_option_attribute|
  json.extract! aws_dhcp_option_attribute, :id, :dhcp_options_id, :key, :value
  json.url aws_dhcp_option_attribute_url(aws_dhcp_option_attribute, format: :json)
end
