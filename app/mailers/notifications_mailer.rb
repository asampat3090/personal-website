class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@anandsampat.com"
  default :to => "asampat3090@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[YourWebsite.tld] #{message.subject}")
  end

end