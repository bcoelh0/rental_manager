class Rental < ActiveRecord::Base
  belongs_to :client, :class_name => "Person", :foreign_key => "person_id"
  belongs_to :house
  belongs_to :user
  validate :empty_house? #, :right_dates?

  accepts_nested_attributes_for :client
  validates_presence_of :start_date, :end_date, :client, :house, :user

  private

  def empty_house?
    start_date.upto(end_date) do |date|
      unless house.vacant?(self, date)
        errors.add(:not_empty, "O imóvel não se encontra disponível nas datas escolhidas")
        break
      end
    end
  end

  def right_dates?
    unless end_date >= start_date
      errors.add(:wrong_dates, "A data de saída deverá ser posterior ou igual à data de entrada.")
    end
  end
end
