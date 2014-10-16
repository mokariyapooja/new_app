json.drivers @drivers do |d|
  json.driver_id      d.id
  json.first_name     d.first_name
  json.last_name      d.last_name
  json.mobile_number  d.mobile_number
  json.email          d.email
end