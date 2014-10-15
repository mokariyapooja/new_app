json.cars @cars do |c|
  json.car_id          c.id
  json.name            c.name
  json.total_passenger c.total_passenger
  json.total_luggage   c.total_luggage
  json.image_url       c.image_url
end