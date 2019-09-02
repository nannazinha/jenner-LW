require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_index_url
    assert_response :success
  end

  test "should get show" do
    get members_show_url
    assert_response :success
  end

  test "should get new" do
    get members_new_url
    assert_response :success
  end

  test "should get create" do
    get members_create_url
    assert_response :success
  end

  test "should get edit" do
    get members_edit_url
    assert_response :success
  end

  test "should get update" do
    get members_update_url
    assert_response :success
  end

  test "should get destroy" do
    get members_destroy_url
    assert_response :success
  end

end
