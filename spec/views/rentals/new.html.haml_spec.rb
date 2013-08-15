require 'spec_helper'

describe "rentals/new" do
  before(:each) do
    assign(:rental, stub_model(Rental,
      :person_id => 1,
      :house_id => 1,
      :notes => "MyText"
    ).as_new_record)
  end

  it "renders new rental form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rentals_path, "post" do
      assert_select "input#rental_person_id[name=?]", "rental[person_id]"
      assert_select "input#rental_house_id[name=?]", "rental[house_id]"
      assert_select "textarea#rental_notes[name=?]", "rental[notes]"
    end
  end
end
