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
      assert_select "input#person_name[name=?]", "person[name]"
      assert_select "input#person_address[name=?]", "person[address]"
      assert_select "input#person_phone_number[name=?]", "person[phone_number]"
      assert_select "input#person_email[name=?]", "person[email]"
      assert_select "input#person_owner[name=?]", "person[owner]"
    end
  end
end
