require "test_helper"

class Panel::PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get panel_pages_index_url
    assert_response :success
  end
end
