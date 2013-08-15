require 'spec_helper'

describe "houses/index" do
  before(:each) do
    assign(:houses, [
      stub_model(House),
      stub_model(House)
    ])
  end

  it "renders a list of houses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
