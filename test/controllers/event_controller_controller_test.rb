require 'test_helper'

class EventControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get event_controller_new_url
    assert_response :success
  end

  test "should get index" do
    get event_controller_index_url
    assert_response :success
  end

  test "should get create" do
    get event_controller_create_url
    assert_response :success
  end

  test "should get destroy" do
    get event_controller_destroy_url
    assert_response :success
  end

  test "should get update" do
    get event_controller_update_url
    assert_response :success
  end

  test "should get show" do
    get event_controller_show_url
    assert_response :success
  end

end
