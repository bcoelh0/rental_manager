class User < ActiveRecord::Base
  has_many :houses
  has_many :rentals
  has_many :people
  validates_presence_of :email, :password
  has_secure_password

  def self.encrypt(pass)
    Digest::MD5.hexdigest(pass)
  end

  def events(date)
    rentals.inject(entries = []) { |mem, rental| entries << rental if rental.start_date == date }
    rentals.inject(exits = []) { |mem, rental| exits << rental if rental.end_date == date }
    houses.inject(empty = []) { |mem, house| empty << house if house.vacant?(date) }
    return entries, exits, empty
  end
end
