namespace :db do
  desc "Populates db"
  task :populate => :environment do
    Person.delete_all
    House.delete_all
    Rental.delete_all
    User.delete_all

    user = FactoryGirl.create(:user)

    @owners = []
    5.times do |i|
      @owners << Person.create(:name => Faker::Name.name,
      :address => Faker::Address.street_address,
      :email => Faker::Internet.email,
      :phone_number => Faker::PhoneNumber.cell_phone,
      :owner => true,
      :user => user)
    end
    @owners.each do |owner|
      House.create( :address => Faker::Address.street_address,
      :category => ["T0", "T1", "T2", "T3", "T4", "T5"].sample,
      :owner => owner,
      :user => user)
    end
    @clients = []
    5.times do |i|
      @clients << Person.create(:name => Faker::Name.name,
      :address => Faker::Address.street_address,
      :email => Faker::Internet.email,
      :phone_number => Faker::PhoneNumber.cell_phone,
      :owner => false,
      :user => user)
    end
    @clients.each_with_index { |client, index| FactoryGirl.create(:rental, :house => @owners[index].houses[0], :client => client, :user => user) }
  end
end