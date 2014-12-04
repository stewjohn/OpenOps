json.array!(@checkpoint_frequencies) do |checkpoint_frequency|
  json.extract! checkpoint_frequency, :id, :name, :hours_apart
  json.url checkpoint_frequency_url(checkpoint_frequency, format: :json)
end
