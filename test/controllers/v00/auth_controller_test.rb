require 'test_helper'

class V1::AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get v1_auth_login_url
    assert_response :success
  end

  test "should get logout" do
    get v1_auth_logout_url
    assert_response :success
  end

  test "should get user" do
    get v1_auth_user_url
    assert_response :success
  end

end
