json.array!(@hosts) do |host|
  json.extract! host, :id, :hostname, :environment_id, :aws_account_id, :sysid, :chef_environment_id, :host_state_id
  json.url host_url(host, format: :json)
end
