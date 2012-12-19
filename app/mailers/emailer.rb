class Emailer < ActionMailer::Base
  default from: "nccl@gmail.com"
  
  def contact_email(contact)
      @contact = contact
      mail(:to => "kiplmailtest@gmail.com", :subject => "#{contact.subject}")
  end
  
end
