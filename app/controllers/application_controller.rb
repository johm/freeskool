class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :user_session

  layout :layout_by_resource


  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to :back
  end

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end


end
