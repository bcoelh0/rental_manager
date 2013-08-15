class Rental < ActiveRecord::Base
  belongs_to :person
  belongs_to :house
end
