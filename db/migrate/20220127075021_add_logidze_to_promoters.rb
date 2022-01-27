class AddLogidzeToPromoters < ActiveRecord::Migration[7.0]
  def change
    add_column :promoters, :log_data, :jsonb

    reversible do |dir|
      dir.up do
        create_trigger :logidze_on_promoters, on: :promoters
      end

      dir.down do
        execute <<~SQL.squish
          DROP TRIGGER IF EXISTS "logidze_on_promoters" on "promoters";
        SQL
      end
    end
  end
end
