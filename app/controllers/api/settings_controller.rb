module Api
  class SettingsController < Panel::ApplicationController
    def token
      token = nil
      loop do
        token = SecureRandom.hex(16)
        break if User.where(personal_api_token: token).empty?
      end
      render json: { token: token }
    end
  end
end
