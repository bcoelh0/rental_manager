require 'spec_helper'

describe "people/index" do
  before(:each) do
    assign(:clients, [
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
    assign(:owners, [])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end

  it "shows clients" do
    render
    expect(rendered).to include("Clientes")
  end
end
