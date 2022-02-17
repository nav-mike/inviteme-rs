module Panel
  class CampaignsController < Panel::ApplicationController
    before_action :set_campaign, only: %i[destroy edit update]

    def index
      respond_to do |format|
        format.html do
          @new_campaign = Campaign.new(amount: 0.0)
          @campaigns = Campaign.where(owner: current_user).order(created_at: :asc).page(params[:page])
        end
        format.csv do
          @campaigns = Campaign.where(owner: current_user).order(created_at: :asc)
          send_data Campaigns::ExportCsv.call(@campaigns), file_name: "campaigns-#{Time.zone.today}.csv"
        end
      end
    end

    def edit(); end

    def show
      @campaign = Campaign.includes(:comments).find(params[:id])
      @comment = Comment.new user: current_user, campaign: @campaign
      @comments = @campaign.comments.with_rich_text_content_and_embeds.order(created_at: :asc).page(params[:page])
      respond_to do |format|
        format.html { @campaign = Panel::CampaignDecorator.decorate(set_campaign) }
        format.csv do
          case params[:report]
          in 'referrals'
            referrals
          in 'promoters'
            promoters
          else
            raise ActionController::RoutingError, 'Not Found'
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
      send_data Referrals::ExportCsv.call(@campaign),
                file_name: "campaign-#{@campaign.id}-#{Time.zone.today}-referrals.csv",
                type: 'text/csv'
    end

    def promoters
      send_data Promoters::ExportCsv.call(@campaign),
                file_name: "campaign-#{@campaign.id}-#{Time.zone.today}-promoters.csv",
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
