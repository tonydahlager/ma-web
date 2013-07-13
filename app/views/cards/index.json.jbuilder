json.array!(@cards) do |card|
  json.extract! card, :title, :description
  json.url card_url(card, format: :json)
end
