json.array!(@rentals) do |rental|
  json.extract! rental, :person_id, :house_id, :start_date, :end_date, :notes
  json.url rental_url(rental, format: :json)
end