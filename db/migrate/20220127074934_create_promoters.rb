class CreatePromoters < ActiveRecord::Migration[7.0]
  def change
    create_table :promoters do |t|
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.integer :campaign_id, null: false
      t.string :token, null: false

      t.timestamps
    end

    add_index :promoters, :campaign_id
    add_index :promoters, :token, unique: true
    add_index :promoters, %i[campaign_id email], unique: true
  end
end
