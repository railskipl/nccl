class Emailer < ActionMailer::Base
  default from: "info@ncclnagpur.com"
  
  def contact_email(contact)
      @contact = contact
      mail(:to => "info@ncclnagpur.com", :subject => "#{contact.subject}")
  end
  
end
