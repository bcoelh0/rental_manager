require 'spec_helper'

describe "Rentals" do
  describe "GET /rentals" do
    before { get rentals_path }

    describe "when visitor is not logged in" do
      it { should redirect_to root_path }
    end
  end
end
