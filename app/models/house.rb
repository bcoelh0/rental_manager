class House < ActiveRecord::Base
  belongs_to :owner, :class_name => "Person", :foreign_key => "person_id"
  has_many :rentals, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :owner
  validates_presence_of :owner, :user

  def vacant?(date)
    unless rentals.empty? #empty from Array, like: array.empty?
      rentals.each do |rental|
        return not(rental.start_date <= date and rental.end_date > date)
      end
    else
      true
    end
  end
end
