class AddLogidzeToCampaigns < ActiveRecord::Migration[7.0]
  def change
    add_column :campaigns, :log_data, :jsonb

    reversible do |dir|
      dir.up do
        create_trigger :logidze_on_campaigns, on: :campaigns
      end

      dir.down do
        execute <<~SQL.squish
          DROP TRIGGER IF EXISTS "logidze_on_campaigns" on "campaigns";
        SQL
      end
    end
  end
end
