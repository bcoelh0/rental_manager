require 'spec_helper'

describe "houses/show" do
  before(:each) do
    @house = FactoryGirl.create(:house, :owner => FactoryGirl.create(:person))
  end

  it "renders attributes in <p>" do
    render

    rendered.should match(/Proprietário/)
    rendered.should match(/Tipologia/)
    rendered.should match(/Morada/)
  end
end
