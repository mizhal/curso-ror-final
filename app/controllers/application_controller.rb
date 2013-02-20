class ApplicationController < ActionController::Base
  protect_from_forgery
  

  def current_user
    User.find session[:user][:id] unless session[:user].blank?
  end
  
  def current_user_id
    return session[:user][:id] unless session[:user].blank?
  end  

  helper_method :current_role?  
  def current_role? role
    return current_user.has_role? role if in_session?
    return false
  end
  
  helper_method :in_session?
  def in_session?
    !session[:user].blank?
  end
  
  ### Redireccion cuando falle la autorizacion con la gema cancan
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  rescue_from ActionController::RedirectBackError do |exception|
    redirect_to root_url
  end
  
end
