class Rental < ActiveRecord::Base
  belongs_to :client, :class_name => "Person", :foreign_key => "person_id"
  belongs_to :house
  belongs_to :user
  accepts_nested_attributes_for :client
  validates_presence_of :client, :house, :user
#  validates :empty_house?



  private

 # def empty_house?()
 #   house.empty?(Date.current)
 # end
end
