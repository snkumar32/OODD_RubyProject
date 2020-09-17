require 'test_helper'

class RegisteredCourseControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get registered_course_show_url
    assert_response :success
  end

end
