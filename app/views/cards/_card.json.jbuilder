json.extract! card, :id, :name, :price, :created_at, :updated_at
json.url card_url(card, format: :json)
