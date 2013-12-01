class House < ActiveRecord::Base
  belongs_to :owner, :class_name => "Person", :foreign_key => "person_id"
  belongs_to :user
  has_many :rentals, :dependent => :destroy
  accepts_nested_attributes_for :owner
  validates_presence_of :owner, :user

  def vacant?(date)
    if rentals.empty?
      true
    else
      rentals.each do |rental|
        return not(rental.start_date <= date and rental.end_date > date)
      end
    end
  end
end
