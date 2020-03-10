module Emails
  class MailerJob < ApplicationJob
    queue_as :user_mailer

    def perform(email, to)
      Emails::UserMailer.with(email: email, to: to).send_email.deliver_now
    end
  end
end