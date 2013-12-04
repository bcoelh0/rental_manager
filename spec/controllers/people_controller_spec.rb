require 'spec_helper'

describe PeopleController do

  let(:user) { FactoryGirl.create(:user) }
  let(:person) { FactoryGirl.create(:person, :user => user) }
  let(:valid_session) { { :user_id => user.id } }

  describe "GET index" do
    let(:owner) { FactoryGirl.create(:person, :owner => true, :user => user) }
    let(:client) { FactoryGirl.create(:person, :user => user) }

    before do
      user.people << client
      user.people << owner
    end

    it "assigns all people as @clients and @owners" do
      get :index, {}, valid_session
      assigns(:owners).should eq([owner])
      assigns(:clients).should eq([client])
    end
  end

  describe "GET show" do
    it "assigns the requested person as @person" do
      get :show, {:id => person.to_param}, valid_session
      assigns(:person).should eq(person)
    end
  end

  describe "GET edit" do
    it "assigns the requested person as @person" do
      get :edit, {:id => person.to_param}, valid_session
      assigns(:person).should eq(person)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested person" do
        Person.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => person.to_param, :person => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested person as @person" do
        put :update, { :id => person.to_param, :person => person.attributes },
                      valid_session
        assigns(:person).should eq(person)
      end

      it "redirects to the person" do
        put :update, { :id => person.to_param, :person => person.attributes },
                       valid_session
        response.should redirect_to(person)
      end
    end

    describe "with invalid params" do
      it "assigns the person as @person" do
        Person.any_instance.stub(:save).and_return(false)
        put :update, { :id => person.to_param,
            :person => { "name" => "invalid value" } }, valid_session
        assigns(:person).should eq(person)
      end

      it "re-renders the 'edit' template" do
        Person.any_instance.stub(:save).and_return(false)
        put :update, { :id => person.to_param,
          :person => { "name" => "invalid value" } }, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before { person }
    it "destroys the requested person" do
      expect {
        delete :destroy, { :id => person.to_param }, valid_session
      }.to change(Person, :count).by(-1)
    end

    it "redirects to the people list" do
      delete :destroy, {:id => person.to_param}, valid_session
      response.should redirect_to(people_url)
    end
  end
end
