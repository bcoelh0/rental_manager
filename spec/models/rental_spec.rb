require 'spec_helper'

describe Rental do
  let(:rental) { FactoryGirl.build(:rental) }
  subject { rental }

  it { should respond_to(:house) }
  it { should respond_to(:client) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:notes) }
  it { should respond_to(:user) }

  it { should belong_to(:client) }
  it { should belong_to(:house) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:client) }
  it { should validate_presence_of(:house) }
  it { should validate_presence_of(:user) }

  describe "#empty_house?" do
    let(:house) { FactoryGirl.create(:house) }

    context "house is empty" do
      let(:first_rental) { FactoryGirl.create(:rental, :start_date => 1.week.ago,
                          :end_date => Date.current) }
      let(:rental) { FactoryGirl.build(:rental, :start_date => Date.tomorrow,
                          :end_date => 1.week.from_now) }
      before do
        house.rentals << first_rental
        rental.send(:empty_house?)
        p rental.errors
      end

      subject { rental.errors.full_messages }
      it { should_not include "Not empty O imóvel não se encontra disponível nas datas escolhidas" }
    end

    context "house is not empty" do
      let(:first_rental) { FactoryGirl.create(:rental, :start_date => 1.week.ago,
                          :end_date => 1.week.from_now) }
      let(:rental) { FactoryGirl.build(:rental, :start_date => Date.current,
                          :end_date => Date.tomorrow) }
      before do
        house.rentals << first_rental
        rental.send(:empty_house?)
      end

      subject { rental.errors.full_messages }
      it { should include "Not empty O imóvel não se encontra disponível nas datas escolhidas" }
    end
  end
end
