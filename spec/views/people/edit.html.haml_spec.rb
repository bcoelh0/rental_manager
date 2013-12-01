require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :name => "MyString",
      :address => "MyString",
      :phone_number => "MyString",
      :email => "MyString",
      :owner => false
    ))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", person_path(@person), "post" do
      assert_select "input#person_name", :count => 1
      assert_select "input#person_address", :count => 1
      assert_select "input#person_phone_number", :count => 1
      assert_select "input#person_email", :count => 1
    end
  end
end
