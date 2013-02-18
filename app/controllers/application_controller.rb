class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    User.find session[:user][:id] unless session[:user].blank?
  end
  
  helper_method :in_session?
  def in_session?
    !session[:user].blank?
  end
  
  ### Redireccion cuando falle la autorizacion con la gema cancan
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
end
