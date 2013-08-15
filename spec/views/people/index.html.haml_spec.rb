require 'spec_helper'

describe "people/index" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :name => "Name",
        :address => "Address",
        :phone_number => "Phone Number",
        :email => "Email",
        :owner => false
      ),
      stub_model(Person,
        :name => "Name",
        :address => "Address",
        :phone_number => "Phone Number",
        :email => "Email",
        :owner => false
      )
    ])
  end

  it "renders a list of people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
