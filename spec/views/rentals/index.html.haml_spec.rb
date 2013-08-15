require 'spec_helper'

describe "rentals/index" do
  before(:each) do
    assign(:rentals, [
      stub_model(Rental,
        :person_id => 1,
        :house_id => 2,
        :notes => "MyText"
      ),
      stub_model(Rental,
        :person_id => 1,
        :house_id => 2,
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of rentals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
