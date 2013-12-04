require 'spec_helper'

describe "rentals/index" do
  before do
    @rentals = 2.times.map { FactoryGirl.create(:rental) }
  end

  it "renders a list of rentals" do
    render
    assert_select "tr>td", :text => @rentals.sample.client.name, :count => 2
  end
end
