module ApplicationHelper
  def signed_in?
    if current_user
      true
    else
      false
    end
  end

  def auth
    redirect_to root_path unless signed_in?
  end

  def new?(params)
    params[:action] == "new"
  end
end
