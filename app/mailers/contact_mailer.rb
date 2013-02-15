class ContactMailer < ActionMailer::Base
  default from: "mpb.desarrollo@gmail.com"
  
  def send_contact_request contact_request, user
    @contact_request = contact_request
    @user = user
    Rails.logger.debug "mail to #{@user.email}"
    mail(
        :to => user.email,
        :subject => I18n.t(".contact_form_notification")
    )
  end
end
