class House < ActiveRecord::Base
  belongs_to :owner, :class_name => "Person", :foreign_key => "person_id"
  has_many :rentals
  belongs_to :user
  accepts_nested_attributes_for :owner
  validates_presence_of :owner, :user

  def empty?(date)
    unless rentals.empty? #empty from Array, like: array.empty?
      if rentals.last.start_date >= date and rentals.last.end_date < date
        false
      else
        true
      end
    end
  end
end
