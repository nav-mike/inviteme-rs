json.extract! panel_team, :id, :name, :logo, :created_at, :updated_at
json.url panel_team_url(panel_team, format: :json)
json.logo url_for(panel_team.logo)
