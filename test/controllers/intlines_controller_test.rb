require 'test_helper'

class IntlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intline = intlines(:one)
  end

  test "should get index" do
    get intlines_url
    assert_response :success
  end

  test "should get new" do
    get new_intline_url
    assert_response :success
  end

  test "should create intline" do
    assert_difference('Intline.count') do
      post intlines_url, params: { intline: { duration: @intline.duration, lineName: @intline.lineName, panel: @intline.panel, remHS: @intline.remHS, remOK: @intline.remOK, ticketN: @intline.ticketN, userHS: @intline.userHS, userOK: @intline.userOK, user_id: @intline.user_id } }
    end

    assert_redirected_to intline_url(Intline.last)
  end

  test "should show intline" do
    get intline_url(@intline)
    assert_response :success
  end

  test "should get edit" do
    get edit_intline_url(@intline)
    assert_response :success
  end

  test "should update intline" do
    patch intline_url(@intline), params: { intline: { duration: @intline.duration, lineName: @intline.lineName, panel: @intline.panel, remHS: @intline.remHS, remOK: @intline.remOK, ticketN: @intline.ticketN, userHS: @intline.userHS, userOK: @intline.userOK, user_id: @intline.user_id } }
    assert_redirected_to intline_url(@intline)
  end

  test "should destroy intline" do
    assert_difference('Intline.count', -1) do
      delete intline_url(@intline)
    end

    assert_redirected_to intlines_url
  end
end
