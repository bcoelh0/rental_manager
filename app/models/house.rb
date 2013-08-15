class House < ActiveRecord::Base
  belongs_to :owner, :class_name => "Person", :foreign_key => "person_id"
  belongs_to :user
  accepts_nested_attributes_for :owner
end
