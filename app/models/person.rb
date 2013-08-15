class Person < ActiveRecord::Base
  has_many :houses
  has_many :rentals
  belongs_to :user
end
