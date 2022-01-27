class CreateReferrals < ActiveRecord::Migration[7.0]
  def change
    create_table :referrals do |t|
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.integer :campaign_id, null: false

      t.timestamps
    end

    add_index :referrals, :campaign_id
    add_index :referrals, %i[campaign_id email], unique: true
  end
end
