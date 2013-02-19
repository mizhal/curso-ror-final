class ContactRequestsController < ApplicationController
  
  layout 'public'
  
  # GET /contact_requests/new
  # GET /contact_requests/new.json
  def new
    @contact_request = ContactRequest.new
    @host_phone = "985 23 21 12"
    @host_email = "email@ixmail.com"
  end

  # POST /contact_requests
  # POST /contact_requests.json
  def create
    @contact_request = ContactRequest.new(params[:contact_request])
    if @contact_request.valid?
      User.administrators.each { |user|
        ContactMailer.send_contact_request(@contact_request, user).deliver
      }
      redirect_to new_contact_request_path, notice: 'Contact request was successfully sent.'
    else
      render action: "new"
    end
  end

end
