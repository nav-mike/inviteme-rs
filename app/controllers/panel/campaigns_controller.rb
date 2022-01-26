module Panel
  class CampaignsController < Panel::ApplicationController
    before_action :set_campaign, only: %i[destroy edit update show]

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
      respond_to do |format|
        format.html { @campaign = Panel::CampaignDecorator.decorate(set_campaign) }
        format.csv do
          case params[:report]
          in 'referrals'
            referrals
          in 'promoters'
            promoters
          else
            raise ActionController::RoutingError.new('Not Found')
          end
        end
      end
    end

    def create
      @campaign = Campaign.new(campaign_params.merge(owner: current_user))
      if @campaign.save
        redirect_to panel_campaigns_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @campaign.update(campaign_params)
        redirect_to panel_campaigns_path
      else
        render :edit, status: :unprocessable_entity
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

    def referrals
      send_data Referrals::ExportCsv.call(@campaign), file_name: "campaign-#{@campaign.id}-#{Date.today}-referrals.csv",
                type: 'text/csv'
    end

    def promoters
      send_data Promoters::ExportCsv.call(@campaign), file_name: "campaign-#{@campaign.id}-#{Date.today}-promoters.csv",
                type: 'text/csv'
    end

    def campaign_params
      params.require(:campaign).permit(:name, :token, :amount)
    end

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end
  end
end
