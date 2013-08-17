class Person < ActiveRecord::Base
  has_many :houses
  has_many :rentals
  belongs_to :user
  validates_presence_of :user
end
