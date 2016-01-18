json.array!(@investigators) do |investigator|
  json.extract! investigator, :id, :name, :location_id
  json.url investigator_url(investigator, format: :json)
end
