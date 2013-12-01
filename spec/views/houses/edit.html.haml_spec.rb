require 'spec_helper'

describe "houses/edit" do
  before do
    @house = assign(:house, FactoryGirl.create(:house,
             :owner => FactoryGirl.create(:person)))
  end

  it "renders the edit house form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do
    assert_select "input#house_address", :count => 1
    assert_select "input#house_category", :count => 1
    end
  end
end
