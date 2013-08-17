class UsersController < ApplicationController
  before_filter :set_user, :only => [:index, :edit]

  def landing
  end

  def index
    @entries_yesterday, @exits_yesterday, @empty_yesterday = @user.events(Date.yesterday)
    @entries_today, @exits_today, @empty_today = @user.events(Date.current)
    @entries_tomorrow, @exits_tomorrow, @empty_tomorrow = @user.events(Date.tomorrow)
  end

  def sign_in
    @user = User.new
  end

  def signing_in
    if user_id = User.sign_in(user_params)
      session[:user_id] = user_id
      redirect_to users_path
    else
      redirect_to sign_in_users_path
    end
  end

  def sign_out
    reset_session
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.password = User.encrypt(user_params["password"])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
