class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :user_session

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to :back
  end

end
