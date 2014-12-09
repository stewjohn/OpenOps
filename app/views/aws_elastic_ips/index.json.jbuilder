json.array!(@aws_elastic_ips) do |aws_elastic_ip|
  json.extract! aws_elastic_ip, :id, :aws_account_id, :aws_region_id, :instance_id, :public_ip, :allocation_id, :association_id, :domain, :network_interface_id, :network_interface_owner_id, :private_ip_address
  json.url aws_elastic_ip_url(aws_elastic_ip, format: :json)
end
