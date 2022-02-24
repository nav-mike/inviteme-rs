class CreateTeamsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :panel_teams_users, id: false do |t|
      t.references :panel_team, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
