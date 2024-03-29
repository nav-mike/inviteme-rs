module Panel::PagesHelper
  def overview?(params)
    params[:controller] == 'panel/pages' && params[:action] == 'index'
  end

  def campaigns?(params)
    params[:controller] == 'panel/campaigns'
  end

  def integrations?(params)
    params[:controller] == 'panel/integrations'
  end

  def tickets?(params)
    params[:controller] == 'panel/tickets'
  end

  def settings?(params)
    params[:controller] == 'panel/settings'
  end

  def new_team?(params)
    params[:controller] == 'panel/teams' && params[:action] == 'new'
  end

  def active_navbar_link_classes(flag)
    flag ? ' bg-emerald-700 text-white border-l-2' : ' hover:bg-slate-900 hover:text-slate-300'
  end
end
