ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.gmail.com',
  :port                 => 587,
  :domain               => 'imap.gmail.com',
  :user_name            => 'kiplmailtest@gmail.com',
  :password             => 'kipltest',
  :authentication       => 'login',
  :enable_starttls_auto => true
}
