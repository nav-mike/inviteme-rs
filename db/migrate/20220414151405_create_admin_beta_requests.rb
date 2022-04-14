# Create beta request table for admin namespace
class CreateAdminBetaRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_beta_requests do |t|
      t.string :full_name
      t.string :email
      t.string :company
      t.integer :status, default: 0

      t.timestamps
    end

    add_index :admin_beta_requests, :email, unique: true
  end
end
