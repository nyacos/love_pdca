require "test_helper"

class DoosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doo = doos(:one)
  end

  test "should get index" do
    get doos_url
    assert_response :success
  end

  test "should get new" do
    get new_doo_url
    assert_response :success
  end

  test "should create doo" do
    assert_difference("Doo.count") do
      post doos_url, params: { doo: { content: @doo.content, title: @doo.title } }
    end

    assert_redirected_to doo_url(Doo.last)
  end

  test "should show doo" do
    get doo_url(@doo)
    assert_response :success
  end

  test "should get edit" do
    get edit_doo_url(@doo)
    assert_response :success
  end

  test "should update doo" do
    patch doo_url(@doo), params: { doo: { content: @doo.content, title: @doo.title } }
    assert_redirected_to doo_url(@doo)
  end

  test "should destroy doo" do
    assert_difference("Doo.count", -1) do
      delete doo_url(@doo)
    end

    assert_redirected_to doos_url
  end
end
