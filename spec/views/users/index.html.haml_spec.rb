require 'spec_helper'

describe "users/index.html.haml" do
  before do
    @user = FactoryGirl.create(:user)
    @house = FactoryGirl.create(:house)
    @user.houses << @house
    @entries_yesterday, @exits_yesterday, @empty_yesterday = @user.events(Date.yesterday)
    @entries_today, @exits_today, @empty_today = @user.events(Date.current)
    @entries_tomorrow, @exits_tomorrow, @empty_tomorrow = @user.events(Date.tomorrow)
    view.stub(:current_user) { @user }
  end

  it "renders events in <ul>" do
    render

    rendered.should match @house.address

  end


end
