class Rental < ActiveRecord::Base
  belongs_to :client, :class_name => "Person", :foreign_key => "person_id"
  belongs_to :house
  belongs_to :user
  accepts_nested_attributes_for :client
  validates_presence_of :client, :house, :user
  #validate :empty_house?
  #validate :right_dates?

  private

  def empty_house?
  end

  def right_dates?
    errors.add(:wrong_dates, "A data de saída deverá ser posterior ou igual à data de entrada.") unless end_date >= start_date
  end
end
