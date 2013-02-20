class RequestsController < ApplicationController
  def create
    @request = Request.new(params[:request])
    if @request.valid?
      User.administrators.each { |user|
        ContactMailer.send_request(@request, user).deliver
      }
      flash[:notice] = 'controllers.requests.create_success'
    else
      flash[:error] = 'controllers.requests.create_failed' + @request.errors.full_messages.join(", ")
    end
    redirect_to :back
  end

end