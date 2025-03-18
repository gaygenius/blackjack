require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test "should redirect root to /games/new" do
    get root_url
    assert_redirected_to "/games/new"
  end

  test "should get health check" do
    get rails_health_check_url
    assert_response :success
  end

  # Add more tests for other routes if needed
end
