json.array!(@instance_enis) do |instance_eni|
  json.extract! instance_eni, :id, :host_id, :instance_id, :network_interface_id, :subnet_id, :vpc_id, :owner_id, :status, :mac_address, :source_dest_check, :attachment_id, :attach_date_time, :public_ip, :public_dns_name, :private_ip_address, :private_dns_name
  json.url instance_eni_url(instance_eni, format: :json)
end
