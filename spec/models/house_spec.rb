require 'spec_helper'

describe House do

  it { should respond_to(:address) }
  it { should respond_to(:category) }
  it { should respond_to(:owner) }
  it { should respond_to(:user) }

  it { should belong_to(:user) }
  it { should belong_to(:owner) }
  it { should have_many(:rentals) }

  it { should validate_presence_of(:owner) }
  it { should validate_presence_of(:user) }

  describe "#vacant?" do
    let(:rented_house) { FactoryGirl.create(:house) }
    let(:rental) { FactoryGirl.create(:rental, :start_date => Date.yesterday,
                    :end_date => Date.tomorrow) }
    before do
      rented_house.rentals << rental
    end

    context "house isn't vacant" do
      it "checks availability" do
        rented_house.vacant?(Time.now).should == false
      end
    end
    context "house is vacant" do
      it "checks availability" do
        rented_house.vacant?(1.week.from_now).should == true
      end
    end
  end
end
