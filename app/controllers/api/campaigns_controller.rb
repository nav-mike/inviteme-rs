module Api
  class CampaignsController < Panel::ApplicationController
    def generate_token
      token = nil
      loop do
        token = SecureRandom.uuid
        break if Campaign.where(token: token).empty?
      end
      render json: { token: token }
    end
  end
end
