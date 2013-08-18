FactoryGirl.define do
  factory :user do
    email "admin@email.com"
    password User.encrypt("random")
  end

  factory :person do
    name Faker::Name.name
    address Faker::Address.street_address
    email Faker::Internet.email
    phone_number Faker::PhoneNumber.cell_phone
    owner false
    user
  end

  factory :house do
    address Faker::Address.street_address
    category ["T0", "T1", "T2", "T3", "T4", "T5"].sample
    association :owner, :factory => :person
    user
  end

  factory :rental do
    association :client, :factory => :person
    house
    start_date Date.current
    end_date Date.tomorrow
    notes Faker::Lorem.paragraph(3)
    user
  end
end