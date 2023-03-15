require "test_helper"

class PublicReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_reports_show_url
    assert_response :success
  end
end
