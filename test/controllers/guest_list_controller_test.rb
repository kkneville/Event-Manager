require 'test_helper'

class GuestListControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get guest_list_create_url
    assert_response :success
  end

  test "should get destroy" do
    get guest_list_destroy_url
    assert_response :success
  end

end
