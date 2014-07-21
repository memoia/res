json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :email, :requested_date, :message, :restaurant_id, :confirmed
  json.url reservation_url(reservation, format: :json)
end
