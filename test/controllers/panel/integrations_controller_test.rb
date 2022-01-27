require "test_helper"

module Panel
  class IntegrationsControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
      get panel_integrations_index_url
      assert_response :success
    end
  end
end
