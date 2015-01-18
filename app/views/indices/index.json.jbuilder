json.array!(@indices) do |index|
  json.extract! index, :id
  json.url index_url(index, format: :json)
end
