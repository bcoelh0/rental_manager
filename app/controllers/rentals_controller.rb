class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    @rentals = Rental.all
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
    if rental_params[:person_attributes]
      @rental = Rental.new(rental_params.except!(:person_attributes).merge(:person_attributes => rental_params["person_attributes"].merge(:owner => false, :user_id => current_user.id)).merge(:user_id => current_user.id))
    else
      @rental = Rental.new(rental_params.merge(:user_id => current_user.id))
    end
    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rental }
      else
        format.html { render action: 'new' }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { head :no_content }
      else
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
    current_user.people.inject(@clients = []) { |mem, person| @clients << [person.name, person.id] unless person.owner }
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:person_id, :house_id, :start_date, :end_date, :notes, :person_attributes => [:name, :address, :phone_number, :email])
  end
end
