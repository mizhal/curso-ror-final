class SessionsController < ApplicationController
  def new
    if request.post?
      user = User.find_by_email params[:email]
      if user
        if user.authenticate params[:password]
          session[:user] = {
            id: user.id,
            name: user.name,
            role: user.role
          }
          flash[:notice] = t("controllers.sessions.welcome_user", 
            :name => user.name
          )
          redirect_to root_path
        else
          flash[:error] = t "controllers.sessions.wrong_password"
        end
      else
        flash[:error] = t "controllers.sessions.unknown_user"
      end
    end
  end

  def destroy
    session[:user] = nil
    redirect_to root_path
  end
end
