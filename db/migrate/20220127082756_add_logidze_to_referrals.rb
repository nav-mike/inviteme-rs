class AddLogidzeToReferrals < ActiveRecord::Migration[7.0]
  def change
    add_column :referrals, :log_data, :jsonb

    reversible do |dir|
      dir.up do
        create_trigger :logidze_on_referrals, on: :referrals
      end

      dir.down do
        execute <<~SQL.squish
          DROP TRIGGER IF EXISTS "logidze_on_referrals" on "referrals";
        SQL
      end
    end
  end
end
