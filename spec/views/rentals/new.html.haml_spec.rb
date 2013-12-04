require 'spec_helper'

describe "rentals/new" do
  before do
    @rental = FactoryGirl.build(:rental)
    @clients = 2.times.map { FactoryGirl.create(:person) }
    @houses = 2.times.map { FactoryGirl.create(:house) }
  end

  it "renders new rental form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rentals_path, "post" do
      assert_select "select#rental_person_id[name=?]", "rental[person_id]"
      assert_select "select#rental_house_id[name=?]", "rental[house_id]"
      assert_select "textarea#rental_notes[name=?]", "rental[notes]"
    end
  end
end
