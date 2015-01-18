json.array!(@sysids) do |sysid|
  json.extract! sysid, :id, :name, :owner, :email_notification
  json.url sysid_url(sysid, format: :json)
end
