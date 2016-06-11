json.array!(@katas) do |kata|
  json.extract! kata, :id, :title, :url, :movements, :movement_links
  json.url kata_url(kata, format: :json)
end
