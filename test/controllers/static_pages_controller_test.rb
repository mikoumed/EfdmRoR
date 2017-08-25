require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
      @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title" , "Home | #{@base_title}"
  end
  
end
