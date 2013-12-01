require 'spec_helper'

describe "people/show" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :name => "Name",
      :address => "Address",
      :phone_number => "Phone Number",
      :email => "Email",
      :owner => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Address/)
    rendered.should match(/Phone Number/)
    rendered.should match(/Email/)
  end
end
