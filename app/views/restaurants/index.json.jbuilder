json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :desc, :full_address, :phone
  json.url restaurant_url(restaurant, format: :json)
end
