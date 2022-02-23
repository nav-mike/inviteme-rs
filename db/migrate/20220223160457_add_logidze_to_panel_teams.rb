class AddLogidzeToPanelTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :panel_teams, :log_data, :jsonb

    reversible do |dir|
      dir.up do
        create_trigger :logidze_on_panel_teams, on: :panel_teams
      end

      dir.down do
        execute <<~SQL.squish
          DROP TRIGGER IF EXISTS "logidze_on_panel_teams" on "panel_teams";
        SQL
      end
    end
  end
end
