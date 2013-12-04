require 'spec_helper'

describe "rentals/edit" do
  before do
    @rental = FactoryGirl.create(:rental)
    @clients = 2.times.map { FactoryGirl.create(:person) }
    @houses = 2.times.map { FactoryGirl.create(:house) }
  end

  it "renders the edit rental form" do
    render

    assert_select "form[action=?][method=?]", rental_path(@rental), "post" do
      assert_select "select#rental_person_id[name=?]", "rental[person_id]"
      assert_select "select#rental_house_id[name=?]", "rental[house_id]"
      assert_select "textarea#rental_notes[name=?]", "rental[notes]"
    end
  end
end
