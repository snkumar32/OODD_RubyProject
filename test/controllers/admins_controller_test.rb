require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get adminLogin" do
    get admins_adminLogin_url
    assert_response :success
  end

end
