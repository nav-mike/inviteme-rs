class AddLogidzeToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :log_data, :jsonb

    reversible do |dir|
      dir.up do
        create_trigger :logidze_on_tickets, on: :tickets
      end

      dir.down do
        execute <<~SQL.squish
          DROP TRIGGER IF EXISTS "logidze_on_tickets" on "tickets";
        SQL
      end
    end
  end
end
