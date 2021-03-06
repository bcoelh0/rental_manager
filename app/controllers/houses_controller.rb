class HousesController < ApplicationController
  include ApplicationHelper

  before_filter :set_house, only: [:show, :edit, :update, :destroy]
  before_filter :auth

  # GET /houses
  # GET /houses.json
  def index
    @houses = current_user.houses
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = House.new
    @house.build_owner
    current_user.people.inject(@owners = []) { |mem, person| @owners << [person.name, person.id] if person.owner }
  end

  # GET /houses/1/edit
  def edit
    current_user.people.inject(@owners = []) { |mem, person| @owners << [person.name, person.id] if person.owner }
  end

  # POST /houses
  # POST /houses.json
  def create
    if house_params[:owner_attributes]
      @house = House.new(house_params.except!(:owner_attributes).merge(:owner_attributes => house_params[:owner_attributes].merge(:owner => "true", :user_id => current_user.id)).merge(:user_id => current_user.id))
    else
      @house = House.new(house_params.merge(:user_id => current_user.id))
    end
    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render action: 'show', status: :created, location: @house }
      else
        format.html { render action: 'new' }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update_attributes(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house ||= House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:person_id, :address, :category, :user_id, :owner_attributes => [:name, :address, :phone_number, :email])
    end
end
