class SessionsController < ApplicationController

  def new
    #login page
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user_id
      redirect_to users_path
    else
      redirect_to sign_in_users_path
    end
  end

  def destroy
    sign_out #lacks implementation
    redirect_to root_path
  end
end
