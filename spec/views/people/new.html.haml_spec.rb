require 'spec_helper'

describe "people/new" do
  before(:each) do
    assign(:person, stub_model(Person,
      :name => "MyString",
      :address => "MyString",
      :phone_number => "MyString",
      :email => "MyString",
      :owner => false
    ).as_new_record)
  end

  it "renders new person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", people_path, "post" do
      assert_select "input#person_name", :count => 1
      assert_select "input#person_address", :count => 1
      assert_select "input#person_phone_number", :count => 1
      assert_select "input#person_email", :count => 1
    end
  end
end
