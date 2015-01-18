json.array!(@host_states) do |host_state|
  json.extract! host_state, :id, :name
  json.url host_state_url(host_state, format: :json)
end
