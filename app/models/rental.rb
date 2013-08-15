class Rental < ActiveRecord::Base
  belongs_to :person
  belongs_to :house
  belongs_to :user
  accepts_nested_attributes_for :person
end
