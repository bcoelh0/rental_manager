require 'spec_helper'

describe "rentals/show" do
  before(:each) do
    @rental = assign(:rental, stub_model(Rental,
      :person_id => 1,
      :house_id => 2,
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
  end
end