class Person < ActiveRecord::Base
  has_many :houses, :dependent => :destroy
  has_many :rentals, :dependent => :destroy
  belongs_to :user
  validates_presence_of :user
end
