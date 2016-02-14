json.array!(@items) do |item|
  json.extract! item, :id, :code, :default_translation, :influence, :observation, :will, :combat, :cost
  json.url item_url(item, format: :json)
end
