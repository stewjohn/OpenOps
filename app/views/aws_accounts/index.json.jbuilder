json.array!(@aws_accounts) do |aws_account|
  json.extract! aws_account, :id, :account_name, :environment_id, :access_key_id, :secrete_access_key
  json.url aws_account_url(aws_account, format: :json)
end
