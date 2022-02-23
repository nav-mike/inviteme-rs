require "application_system_test_case"

module Panel
  class TeamsTest < ApplicationSystemTestCase
    setup do
      @panel_team = panel_teams(:one)
    end

    test "visiting the index" do
      visit panel_teams_url
      assert_selector "h1", text: "Teams"
    end

    test "should create team" do
      visit panel_teams_url
      click_on "New team"

      fill_in "Name", with: @panel_team.name
      click_on "Create Team"

      assert_text "Team was successfully created"
      click_on "Back"
    end

    test "should update Team" do
      visit panel_team_url(@panel_team)
      click_on "Edit this team", match: :first

      fill_in "Name", with: @panel_team.name
      click_on "Update Team"

      assert_text "Team was successfully updated"
      click_on "Back"
    end

    test "should destroy Team" do
      visit panel_team_url(@panel_team)
      click_on "Destroy this team", match: :first

      assert_text "Team was successfully destroyed"
    end
  end
end
