class House < ActiveRecord::Base
  belongs_to :ownwer, :class_name => "Person", :foreign_key => "person_id"
  belongs_to :user
end
