class ApplicationMailer < ActionMailer::Base
  default to: ENV['RECIPIENT_EMAIL']
  layout "mailer"
end
