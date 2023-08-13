require "test_helper"

class ModifyControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get modify_edit_url
    assert_response :success
  end

  test "should get update" do
    get modify_update_url
    assert_response :success
  end
end
