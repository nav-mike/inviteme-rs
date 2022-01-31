class CreatePanelTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets, id: :uuid do |t|
      t.string :title
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.integer :status
      t.text :message

      t.timestamps
    end
  end
end
