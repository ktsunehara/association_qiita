require 'test_helper'

class IinesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get iines_create_url
    assert_response :success
  end

  test "should get destroy" do
    get iines_destroy_url
    assert_response :success
  end

end
