class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  # GET /rentals
  # GET /rentals.json
  def index
    @rentals = Rental.all
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
    #debugger
    @rental.build_client
    @houses = current_user.houses.map { |house| [house.address, house.id] }
    @clients = current_user.people.map { |person| [person.name, person.id] unless person.owner }
  end

  # GET /rentals/1/edit
  def edit
    @houses = current_user.houses.map { |house| [house.address, house.id] }
    @clients = current_user.people.map { |person| [person.name, person.id] unless person.owner }
  end

  # POST /rentals
  # POST /rentals.json
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

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
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

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:person_id, :house_id, :start_date, :end_date, :notes, :person_attributes => [:name, :address, :phone_number, :email])
    end
end
