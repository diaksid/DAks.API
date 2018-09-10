require 'test_helper'

class V1::ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get deliver" do
    put v1_contact_deliver_url
    assert_response :success
  end

end
