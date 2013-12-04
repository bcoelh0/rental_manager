require 'spec_helper'

describe "rentals/show" do
  before do
    @rental = FactoryGirl.create(:rental)
  end

  it "renders attributes in <p>" do
    render

    rendered.should match @rental.house.address
    rendered.should match @rental.house.category
    rendered.should match @rental.notes
  end
end
