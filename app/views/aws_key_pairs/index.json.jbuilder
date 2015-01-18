json.array!(@aws_key_pairs) do |aws_key_pair|
  json.extract! aws_key_pair, :id, :aws_account_id, :aws_region_id, :key_name, :key_fingerprint
  json.url aws_key_pair_url(aws_key_pair, format: :json)
end
