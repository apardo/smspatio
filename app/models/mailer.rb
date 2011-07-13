class Mailer < ActionMailer::Base
  
  def send_sms(contacts, message)
    @recipients       = "sms@messaging.clickatell.com"
    @from             = "antonio.pardo@gmail.com"
    @subject          = nil
    @sent_on          = Time.now
    @body[:contacts]  = contacts
    @body[:message]   = message 
  end
end
