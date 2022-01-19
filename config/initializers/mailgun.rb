# Mailgun client config
module MailgunClient
  class << self
    def client
      @client ||= Mailgun::Client.new(Rails.application.credentials.mailgun_api_key)
    end
  end
end
