require 'spec_helper'

describe HousesController do

  let(:user) { FactoryGirl.create(:user) }
  let(:house) { FactoryGirl.create(:house, :user => user) }
  let(:valid_session) { {:user_id => user.id} }
  let(:valid_session) { { :user_id => user.id } }

  describe "GET index" do
    it "assigns all houses as @houses" do
      get :index, {}, valid_session
      assigns(:houses).should eq([house])
    end
  end

  describe "GET show" do
    it "assigns the requested house as @house" do
      get :show, {:id => house.to_param}, valid_session
      assigns(:house).should eq(house)
    end
  end

  describe "GET new" do
    it "assigns a new house as @house" do
      get :new, {}, valid_session
      assigns(:house).should be_a_new(House)
    end
  end

  describe "GET edit" do
    it "assigns the requested house as @house" do
      get :edit, { :id => house.to_param }, valid_session
      assigns(:house).should eq(house)
    end
  end

  describe "POST create" do
    let(:house){ FactoryGirl.build(:house) }
    describe "with valid params" do
      it "creates a new House" do
        expect {
          post :create, { :house => house.attributes }, valid_session
        }.to change(House, :count).by(1)
      end

      before { post :create, {:house => house.attributes }, valid_session }

      it "assigns a newly created house as @house" do
        assigns(:house).should be_a(House)
        assigns(:house).should be_persisted
      end

      it "redirects to the created house" do
        response.should redirect_to(House.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved house as @house" do
        House.any_instance.stub(:save).and_return(false)
        post :create, { :house => { :category => "invalid value" } },
              valid_session
        assigns(:house).should be_a_new(House)
      end

      it "re-renders the 'new' template" do
        House.any_instance.stub(:save).and_return(false)
        post :create, {:house => { :category => "invalid value" } },
              valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before do
        put :update, {:id => house.to_param,
          :house => { :category => "T6" } }, valid_session
        house.reload
      end

      subject { house }
      its(:category) { should == "T6" }

      it "assigns the requested house as @house" do
        assigns(:house).should eq(house)
      end

      it "redirects to the house" do
        response.should redirect_to(house)
      end
    end

    describe "with invalid params" do
      it "assigns the house as @house" do
        House.any_instance.stub(:save).and_return(false)
        put :update, { :id => house.to_param,
          :house => { :category => "invalid value" } }, valid_session
        assigns(:house).should eq(house)
      end

      it "re-renders the 'edit' template" do
        House.any_instance.stub(:save).and_return(false)
        put :update, { :id => house.to_param,
          :house => { :category => "invalid value" } }, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before { house }
    it "destroys the requested house" do
      expect {
        delete :destroy, { :id => house.to_param }, valid_session
      }.to change(House, :count).by(-1)
    end

    it "redirects to the houses list" do
      delete :destroy, { :id => house.to_param }, valid_session
      response.should redirect_to(houses_url)
    end
  end
end
