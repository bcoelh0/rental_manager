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
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
