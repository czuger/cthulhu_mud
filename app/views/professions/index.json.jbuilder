json.array!(@professions) do |profession|
  json.extract! profession, :id, :name, :start_place_id
  json.url profession_url(profession, format: :json)
end
