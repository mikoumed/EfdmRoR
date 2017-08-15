require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	test "Invalid sign up information" do
		get signup_path
		assert_no_difference 'User.count' do
			post signup_path, params: { user: { name: "",
												email: "invalid@mail",
												password: "foo",
												password_confirmation: "bar" }}
		end
		assert_template 'users/new'
		assert_select 'div#error_explanation'
    	assert_select 'div.alert'
	end

	test "valid signup information" do
		get signup_path
		assert_difference 'User.count', 1 do
			post signup_path, params: { user: { name: "user",
												email: "user@mail.com",
												password: "password",
												password_confirmation: "password" }}
		end
		follow_redirect!
		assert_template 'users/show'
		assert_not flash.empty?
		assert is_logged_in?
	end
end
