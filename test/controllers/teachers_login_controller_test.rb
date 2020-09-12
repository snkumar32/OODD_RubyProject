require 'test_helper'

class TeachersLoginControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get teachers_login_show_url
    assert_response :success
  end

end
