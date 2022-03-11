class AddTeamToCampaign < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_reference :campaigns, :panel_team, index: { algorithm: :concurrently }
  end
end
