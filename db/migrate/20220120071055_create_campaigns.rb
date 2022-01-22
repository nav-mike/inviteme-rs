class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.integer :owner_id
      t.string :token
      t.float :amount

      t.timestamps
    end
    add_index :campaigns, :owner_id
    add_index :campaigns, :token, unique: true
    add_index :campaigns, %i[owner_id name], unique: true
  end
end
