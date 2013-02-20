class RequestsController < ApplicationController
  def create
    @request = Request.new(params[:request])
    if @request.valid?
      User.administrators.each { |user|
        ContactMailer.send_contact_request(@request, user).deliver
      }
      flash[:notice] = 'controllers.requests.create_success'
    else
      flash[:error] = 'controllers.requests.create_failed'
      render action: "new"
    end
    redirect_to :back
  end

end