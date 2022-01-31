class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.integer :message_type, default: 0, null: false
      t.string :title, null: false
      t.text :message, null: false
      t.boolean :seen, default: false
      t.boolean :completed, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
