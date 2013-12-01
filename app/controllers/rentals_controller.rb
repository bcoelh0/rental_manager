class RentalsController < ApplicationController
  include ApplicationHelper

  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  before_filter :auth

  def index
    @rentals = current_user.rentals
  end

  def show
  end

  def new
    @rental = Rental.new
    @rental.build_client
    all_people_and_houses
  end

  def edit
    all_people_and_houses
  end

  def create
    if rental_params[:client_attributes]
      @rental = Rental.new(rental_params.except!(:client_attributes).merge(:client_attributes => rental_params[:client_attributes].merge(:owner => false, :user_id => current_user.id)).merge(:user_id => current_user.id))
    else
      @rental = Rental.new(rental_params.merge(:user_id => current_user.id))
    end
    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rental }
      else
        all_people_and_houses
        format.html { render "new" }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rental.update_attributes(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { head :no_content }
      else
        all_people_and_houses
        format.html { render action: 'edit' }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url }
      format.json { head :no_content }
    end
  end

  private

  def all_people_and_houses
    current_user.houses.inject(@houses = []) { |mem, house| @houses << [house.address, house.id] }
    current_user.people.inject(@clients = []) { |mem, person| @clients << [person.name, person.id] }
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:person_id, :house_id, :start_date, :end_date, :notes, :client_attributes => [:name, :address, :phone_number, :email])
  end
end
