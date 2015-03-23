json.array!(@dvds) do |dvd|
  json.extract! dvd, :id, :genre, :year, :rated, :published
  json.url dvd_url(dvd, format: :json)
end
