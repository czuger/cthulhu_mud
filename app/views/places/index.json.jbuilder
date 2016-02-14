json.array!(@places) do |place|
  json.extract! place, :id, :default_translation, :parent, :gender, :city, :well_known_place
  json.url place_url(place, format: :json)
end
