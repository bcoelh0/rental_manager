require 'spec_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_session) { {:user_id => user.id} }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', {}, valid_session
      response.should be_success
    end
  end

  describe "GET 'sign_in'" do
    it "returns http success" do
      get 'sign_in'
      response.should be_success
    end
  end

  describe "GET 'sign_out'" do
    it "returns http success" do
      get 'sign_out', {}, valid_session
      response.should redirect_to root_path
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:user) { FactoryGirl.build(:user) }
      it "creates a new User" do
        expect {
          post :create, { :user => user.attributes }, valid_session
        }.to change(User, :count).by(1)
      end
    end
  end
end
