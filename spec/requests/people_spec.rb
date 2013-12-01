require 'spec_helper'

describe "People" do
  describe "GET /people" do
    before { get people_path }

    describe "when visitor is not logged in" do
      it { should redirect_to root_path }
    end
  end
end
