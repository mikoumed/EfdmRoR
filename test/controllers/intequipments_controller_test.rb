require 'test_helper'

class IntequipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intequipment = intequipments(:one)
  end

  test "should get index" do
    get intequipments_url
    assert_response :success
  end

  test "should get new" do
    get new_intequipment_url
    assert_response :success
  end

  test "should create intequipment" do
    assert_difference('Intequipment.count') do
      post intequipments_url, params: { intequipment: {  } }
    end

    assert_redirected_to intequipment_url(Intequipment.last)
  end

  test "should show intequipment" do
    get intequipment_url(@intequipment)
    assert_response :success
  end

  test "should get edit" do
    get edit_intequipment_url(@intequipment)
    assert_response :success
  end

  test "should update intequipment" do
    patch intequipment_url(@intequipment), params: { intequipment: {  } }
    assert_redirected_to intequipment_url(@intequipment)
  end

  test "should destroy intequipment" do
    assert_difference('Intequipment.count', -1) do
      delete intequipment_url(@intequipment)
    end

    assert_redirected_to intequipments_url
  end
end
