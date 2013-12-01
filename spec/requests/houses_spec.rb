require 'spec_helper'

describe "Houses" do
  describe "GET /houses" do
    before { get houses_path }

    describe "when visitor is not logged in" do
      it { should redirect_to root_path }
    end
  end
end
