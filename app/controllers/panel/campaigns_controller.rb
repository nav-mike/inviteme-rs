module Panel
  class CampaignsController < Panel::ApplicationController
    before_action :set_campaign, only: %i[destroy edit show]

    def index
      respond_to do |format|
        format.html do
          @new_campaign = Campaign.new(amount: 0.0)
          @campaigns = Campaign.where(owner: current_user).order(created_at: :asc).page(params[:page])
        end
        format.csv do
          @campaigns = Campaign.where(owner: current_user).order(created_at: :asc)
          send_data Campaigns::ExportCsv.call(@campaigns), file_name: "campaigns-#{Date.today}.csv"
        end
      end
    end

    def edit(); end

    def show
      @campaign = Panel::CampaignDecorator.decorate(set_campaign)
    end

    def create
      @campaign = Campaign.new(campaign_params.merge(owner: current_user))
      if @campaign.save
        redirect_to panel_campaigns_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      if @campaign.destroy
        redirect_to panel_campaigns_path
      else
        render :index, status: :unprocessable_entity
      end
    end

    private

    def campaign_params
      params.require(:campaign).permit(:name, :token, :amount)
    end

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end
  end
end
