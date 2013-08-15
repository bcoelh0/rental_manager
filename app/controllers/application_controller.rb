class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def add_owner_attr(params, value, type)
    if type == "client"
      params.except!(:person_attributes).merge(:person_attributes => params["person_attributes"].merge(:owner => value, :user_id => current_user.id)).merge(:user_id => current_user.id)
    elsif type == "owner"
      params.except!(:owner).merge(:owner => params["owner"].merge(:owner => value, :user_id => current_user.id)).merge(:user_id => current_user.id)
    end
  end

  helper_method :current_user, :add_owner_attr
end
