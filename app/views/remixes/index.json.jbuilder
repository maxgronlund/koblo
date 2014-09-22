json.array!(@remixes) do |remix|
  json.extract! remix, :id, :title, :user_id, :price, :image, :original_id, :original_mix
  json.url remix_url(remix, format: :json)
end
