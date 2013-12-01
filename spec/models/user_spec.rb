require 'spec_helper'

describe User do
  it { should respond_to(:email) }
  it { should respond_to(:password) }

  it { should have_many(:people) }
  it { should have_many(:rentals) }
  it { should have_many(:houses) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  describe "#sign_in" do
    #to be changed
    pending "make this right!"
  end

  describe "#events" do
    let(:user) { FactoryGirl.create(:user) }
    let(:rented_house) { FactoryGirl.create(:house) }
    let(:rental) { FactoryGirl.create(:rental, :start_date => Date.current,
                    :end_date => Date.tomorrow) }
    before do
      user.rentals << rental
      @entries, @exits, @empty = user.events(Date.current)
    end

    it "houses' entries" do
      @entries.should_not be_empty
    end
    it "houses' exits" do
      @exits.should be_empty
    end
    it "empty houses" do
      @empty.should be_empty
    end
  end
end
