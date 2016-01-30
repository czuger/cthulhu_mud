json.array!(@monsters) do |monster|
  json.extract! monster, :id, :code, :default_translation, :hit_points, :horror, :combat, :apparition_weight
  json.url monster_url(monster, format: :json)
end
