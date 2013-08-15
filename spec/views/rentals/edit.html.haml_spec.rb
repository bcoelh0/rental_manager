require 'spec_helper'

describe "rentals/edit" do
  before(:each) do
    @rental = assign(:rental, stub_model(Rental,
      :person_id => 1,
      :house_id => 1,
      :notes => "MyText"
    ))
  end

  it "renders the edit rental form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rental_path(@rental), "post" do
      assert_select "input#rental_person_id[name=?]", "rental[person_id]"
      assert_select "input#rental_house_id[name=?]", "rental[house_id]"
      assert_select "textarea#rental_notes[name=?]", "rental[notes]"
    end
  end
end
