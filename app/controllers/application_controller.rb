class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    User.find session[:user][:id] unless session[:user].blank?
  end
end
