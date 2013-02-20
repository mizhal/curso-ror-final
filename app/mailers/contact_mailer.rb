class ContactMailer < ActionMailer::Base
  default from: "mpb.desarrollo@gmail.com"
  
  def send_contact_request contact_request, user
    @contact_request = contact_request
    @user = user
    mail(
        :to => user.email,
        :subject => I18n.t(".contact_form_notification")
    )
  end

  def send_request request, user
    @request = request
    @user = user
    mail(
        :to => user.email,
        :subject => I18n.t(".request_notification")
    )
  end

end
