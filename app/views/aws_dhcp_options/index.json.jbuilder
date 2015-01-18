json.array!(@aws_dhcp_options) do |aws_dhcp_option|
  json.extract! aws_dhcp_option, :id, :aws_account_id, :aws_region_id, :dhcp_options_id
  json.url aws_dhcp_option_url(aws_dhcp_option, format: :json)
end
