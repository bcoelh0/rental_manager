namespace :db do
  desc "Populates db"
  task :populate => :environment do
    Person.delete_all
    House.delete_all
    Rental.delete_all
    User.delete_all

    user = FactoryGirl.create(:user)

    @owners = []
    5.times { |i| @owners << FactoryGirl.create(:person, :name => "owner_#{i}", :owner => true, :user => user) }
    @owners.each { |owner| FactoryGirl.create(:house, :user => user, :owner => owner, :user => user) }
    @clients = []
    5.times { |i| @clients << FactoryGirl.create(:person, :name => "client_#{i}", :owner => false, :user => user)  }
    @clients.each_with_index { |client, index| FactoryGirl.create(:rental, :house => @owners[index].houses[0], :client => client, :user => user) }
  end
end