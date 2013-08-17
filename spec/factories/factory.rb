FactoryGirl.define do
  factory :user do
    email "admin@email.com"
    password User.encrypt("random")
  end

  factory :person do
    name "Zé"
    address "Rua random, nº 5"
    email "ze@email.com"
    phone_number "912222222"
    owner false
    user
  end

  factory :house do
    address "Rua da casa random, nº10"
    category "T5"
    association :owner, :factory => :person
    user
  end

  factory :rental do
    association :client, :factory => :person
    house
    start_date Date.current
    end_date Date.tomorrow
    notes "Random notes"
    user
  end
end