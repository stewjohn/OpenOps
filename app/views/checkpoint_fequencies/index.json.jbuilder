json.array!(@checkpoint_fequencies) do |checkpoint_fequency|
  json.extract! checkpoint_fequency, :id, :name, :hours_apart
  json.url checkpoint_fequency_url(checkpoint_fequency, format: :json)
end
