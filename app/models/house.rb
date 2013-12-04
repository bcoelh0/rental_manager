class House < ActiveRecord::Base
  belongs_to :owner, :class_name => "Person", :foreign_key => "person_id"
  belongs_to :user
  has_many :rentals, :dependent => :destroy
  accepts_nested_attributes_for :owner
  validates_presence_of :owner, :user

  def vacant?(date)
    rentals.where("start_date <= ? AND end_date > ?", date, date).empty?
  end
end
