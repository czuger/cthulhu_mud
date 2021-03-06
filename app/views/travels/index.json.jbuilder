json.array!(@travels) do |travel|
  json.extract! travel, :id, :place_from_if, :place_to_id, :cost, :duration
  json.url travel_url(travel, format: :json)
end
