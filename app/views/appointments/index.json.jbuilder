json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :visit_date, :reason, :required_reminder, :pet_id
  json.url appointment_url(appointment, format: :json)
end
