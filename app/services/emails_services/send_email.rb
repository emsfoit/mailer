module EmailsServices
  class SendEmail
    attr_reader :email

    def initialize(email)
      @email = email
    end

    def create
      @email.receivers.map do |receiver|
        ::Emails::MailerJob.perform_later(@email, receiver)
        sleep(0.5)
      end
      @email.update(state: "Email has been sent")
    end

    def self.run(email)
      email_service = new(email)
      email_service.create
    end
  end
end
