require "test_helper"

class CompetitionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get competition_new_url
    assert_response :success
  end

  test "should get create" do
    get competition_create_url
    assert_response :success
  end

  test "should get edit" do
    get competition_edit_url
    assert_response :success
  end

  test "should get show" do
    get competition_show_url
    assert_response :success
  end

  test "should get destory" do
    get competition_destory_url
    assert_response :success
  end

  test "should get update" do
    get competition_update_url
    assert_response :success
  end
end
