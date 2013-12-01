require 'spec_helper'

describe RentalsController do

  let(:user) { FactoryGirl.create(:user) }
  let(:client) { FactoryGirl.create(:person) }
  let(:rental) { FactoryGirl.create(:rental) }
  let(:house) { FactoryGirl.create(:house) }
  let(:valid_session) { {:user_id => user.id} }

  describe "GET index" do
    it "assigns all rentals as @rentals" do
      get :index, {}, valid_session
      assigns(:rentals).should eq(user.rentals)
    end
  end

  describe "GET show" do
    it "assigns the requested rental as @rental" do
      get :show, {:id => rental.to_param}, valid_session
      assigns(:rental).should eq(rental)
    end
  end

  describe "GET new" do
    it "assigns a new rental as @rental" do
      get :new, {}, valid_session
      assigns(:rental).should be_a_new(Rental)
    end
  end

  describe "GET edit" do
    it "assigns the requested rental as @rental" do
      get :edit, {:id => rental.to_param}, valid_session
      assigns(:rental).should eq(rental)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:rental) { FactoryGirl.build(:rental) }

      it "creates a new Rental" do
        expect {
          post :create, { :rental => rental.attributes }, valid_session
        }.to change(Rental, :count).by(1)
      end

      it "assigns a newly created rental as @rental" do
        post :create, {:rental => rental.attributes}, valid_session
        assigns(:rental).should be_a(Rental)
        assigns(:rental).should be_persisted
      end

      it "redirects to the created rental" do
        post :create, {:rental => rental.attributes}, valid_session
        response.should redirect_to(Rental.last)
      end
    end

    describe "with invalid params" do
      before do
        Rental.any_instance.stub(:save).and_return(false)
        post :create, {:rental => { "person_id" => "invalid value" }}, valid_session
      end

      it "@rental should be a new rental" do
        assigns(:rental).should be_a_new(Rental)
      end

      subject { response }
      it { should render_template(:new) }
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before do
        put :update, { :id => rental.to_param, :rental => { :notes => "Changed note." } }, valid_session
        rental.reload
      end

      it "rental notes" do
        rental.notes.should == "Changed note."
      end

      it "@rental should be a new rental" do
        assigns(:rental).should eq(rental)
      end

      subject { response }
      it { should redirect_to(rental) }
    end

    describe "with invalid params" do
      before do
        Rental.any_instance.stub(:save).and_return(false)
        put :update, {:id => rental.to_param, :rental => { "person_id" => "invalid value" }}, valid_session
      end

      it "@rental should be a new rental" do
        assigns(:rental).should eq(rental)
      end

      subject { response }
      it { should render_template(:edit) }
    end
  end

  describe "DELETE destroy" do
    before { rental }
    it "destroys the requested rental" do
      expect {
        delete :destroy, {:id => rental.to_param}, valid_session
      }.to change(Rental, :count).by(-1)
    end

    it "redirects to the rentals list" do
      delete :destroy, {:id => rental.to_param}, valid_session
      response.should redirect_to(rentals_url)
    end
  end
end
