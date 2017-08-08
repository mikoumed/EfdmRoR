require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
      @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get root" do
    get root_path
    assert_response :success
  end

  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title" , "Home | #{@base_title}"
  end

  test "should get signup" do
    get signup_path
    assert_response :success
    assert_select "title" , "Sign Up | #{@base_title}"
  end

end
