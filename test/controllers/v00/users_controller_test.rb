require 'test_helper'

class V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_users_index_url
    assert_response :success
  end

  test "should get show" do
    get v1_users_show_url
    assert_response :success
  end

end
