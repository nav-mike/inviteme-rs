module Panel
  class CampaignsController < Panel::ApplicationController
    def index
      @new_campaign = Campaign.new
    end

    def create
      @campaign = Campaign.new(campaign_params)
      if @campaign.save
        redirect_to panel_campaigns_path
      else
        render :new
      end
    end

    private

    def campaign_params
      params.require(:campaign).permit(:name, :token, :amount)
    end
  end
end
