json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :first_guest_name, :second_guest_name, :third_guest_name, :carts, :date_and_time
  json.url reservation_url(reservation, format: :json)
end
