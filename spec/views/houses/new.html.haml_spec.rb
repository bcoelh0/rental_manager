require 'spec_helper'

describe "houses/new" do
  before do
    @house = FactoryGirl.build(:house)
    @owners = [FactoryGirl.create(:person), FactoryGirl.create(:person)]
  end

  it "renders the new house form" do
    render

    assert_select "form[action=?][method=?]", houses_path, "post" do
      assert_select "input#house_address", :count => 1
      assert_select "input#house_category", :count => 1
    end
  end
end

