class AddPersonalTokenToUser < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_column :users, :personal_api_token, :string
    add_index :users, :personal_api_token, algorithm: :concurrently, unique: true
  end
end
