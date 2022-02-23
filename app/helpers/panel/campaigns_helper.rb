module Panel
  module CampaignsHelper
    def form_method(params)
      params[:action] == 'edit' ? :patch : :post
    end

    def form_url(params)
      params[:action] == 'edit' ? :panel_campaign : :panel_campaigns
    end
  end
end
