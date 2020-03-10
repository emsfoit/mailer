module Emails
  class UserMailer < ApplicationMailer
    def send_email
      email = params[:email]
      to = params[:to]
      subject = email.subject
      @body = email.body
      mail(to: to, subject: subject)
    end
  end
end

