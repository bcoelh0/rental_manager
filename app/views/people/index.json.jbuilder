json.array!(@people) do |person|
  json.extract! person, :name, :address, :phone_number, :email, :owner
  json.url person_url(person, format: :json)
end