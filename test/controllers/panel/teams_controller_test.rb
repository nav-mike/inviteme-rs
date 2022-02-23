require "test_helper"

module Panel
  class TeamsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @panel_team = panel_teams(:one)
    end

    test "should get index" do
      get panel_teams_url
      assert_response :success
    end

    test "should get new" do
      get new_panel_team_url
      assert_response :success
    end

    test "should create panel_team" do
      assert_difference("Panel::Team.count") do
        post panel_teams_url, params: { panel_team: { name: @panel_team.name } }
      end

      assert_redirected_to panel_team_url(Panel::Team.last)
    end

    test "should show panel_team" do
      get panel_team_url(@panel_team)
      assert_response :success
    end

    test "should get edit" do
      get edit_panel_team_url(@panel_team)
      assert_response :success
    end

    test "should update panel_team" do
      patch panel_team_url(@panel_team), params: { panel_team: { name: @panel_team.name } }
      assert_redirected_to panel_team_url(@panel_team)
    end

    test "should destroy panel_team" do
      assert_difference("Panel::Team.count", -1) do
        delete panel_team_url(@panel_team)
      end

      assert_redirected_to panel_teams_url
    end
  end
end
