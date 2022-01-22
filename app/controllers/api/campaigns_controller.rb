module Api
  class CampaignsController < Panel::ApplicationController
    def uniq_token
      render json: { used: Campaign.where(token: params[:token]).size }
    end
  end
end
