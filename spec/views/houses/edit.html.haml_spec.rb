require 'spec_helper'

describe "houses/edit" do
  before do
    @house = FactoryGirl.create(:house,
             :owner => FactoryGirl.create(:person))
    @owners = 2.times.map { FactoryGirl.create(:person) }
  end

  it "renders the edit house form" do
    render

    assert_select "form[action=?][method=?]", house_path(@house), "post" do
      assert_select "input#house_address", :count => 1
      assert_select "input#house_category", :count => 1
    end
  end
end
