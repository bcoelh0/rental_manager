require 'spec_helper'

describe RentalsController do

  let(:user) { FactoryGirl.create(:user) }
  let(:rental) { FactoryGirl.create(:rental) }

  let(:valid_attributes) { { "person_id" => "1" } }

  let(:valid_session) { {:user_id => user.id} }


  describe "GET index" do
    it "assigns all rentals as @rentals" do
      get :index, {}, valid_session
      assigns(:rentals).should eq(user.rentals)
    end
  end

  describe "GET show" do
    it "assigns the requested rental as @rental" do
      rental = Rental.create! valid_attributes
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
      rental = Rental.create! valid_attributes
      get :edit, {:id => rental.to_param}, valid_session
      assigns(:rental).should eq(rental)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Rental" do
        expect {
          post :create, {:rental => valid_attributes}, valid_session
        }.to change(Rental, :count).by(1)
      end

      it "assigns a newly created rental as @rental" do
        post :create, {:rental => valid_attributes}, valid_session
        assigns(:rental).should be_a(Rental)
        assigns(:rental).should be_persisted
      end

      it "redirects to the created rental" do
        post :create, {:rental => valid_attributes}, valid_session
        response.should redirect_to(Rental.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved rental as @rental" do
        # Trigger the behavior that occurs when invalid params are submitted
        Rental.any_instance.stub(:save).and_return(false)
        post :create, {:rental => { "person_id" => "invalid value" }}, valid_session
        assigns(:rental).should be_a_new(Rental)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Rental.any_instance.stub(:save).and_return(false)
        post :create, {:rental => { "person_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested rental" do
        rental = Rental.create! valid_attributes
        # Assuming there are no other rentals in the database, this
        # specifies that the Rental created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Rental.any_instance.should_receive(:update).with({ "person_id" => "1" })
        put :update, {:id => rental.to_param, :rental => { "person_id" => "1" }}, valid_session
      end

      it "assigns the requested rental as @rental" do
        rental = Rental.create! valid_attributes
        put :update, {:id => rental.to_param, :rental => valid_attributes}, valid_session
        assigns(:rental).should eq(rental)
      end

      it "redirects to the rental" do
        rental = Rental.create! valid_attributes
        put :update, {:id => rental.to_param, :rental => valid_attributes}, valid_session
        response.should redirect_to(rental)
      end
    end

    describe "with invalid params" do
      it "assigns the rental as @rental" do
        rental = Rental.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Rental.any_instance.stub(:save).and_return(false)
        put :update, {:id => rental.to_param, :rental => { "person_id" => "invalid value" }}, valid_session
        assigns(:rental).should eq(rental)
      end

      it "re-renders the 'edit' template" do
        rental = Rental.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Rental.any_instance.stub(:save).and_return(false)
        put :update, {:id => rental.to_param, :rental => { "person_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested rental" do
      rental = Rental.create! valid_attributes
      expect {
        delete :destroy, {:id => rental.to_param}, valid_session
      }.to change(Rental, :count).by(-1)
    end

    it "redirects to the rentals list" do
      rental = Rental.create! valid_attributes
      delete :destroy, {:id => rental.to_param}, valid_session
      response.should redirect_to(rentals_url)
    end
  end

end
