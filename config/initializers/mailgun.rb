# Mailgun client config
module MailgunClient
  class << self
    def client
      @client ||= Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
    end
  end
end
