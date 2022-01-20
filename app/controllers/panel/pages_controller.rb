class Panel::PagesController < Panel::ApplicationController
  def index
  end

  def campaigns
    @new_campaign = Campaign.new
  end

  def integrations
  end

  def documentation
  end

  def settings
  end
end
