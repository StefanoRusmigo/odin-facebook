require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "non-logged users access to sign in only" do 
  	get users_url
  	assert_not flash.empty?
  	assert_redirected_to new_user_session_path
  end

  test "logged-in users" do 
  	get users_url
  	assert_template 'users#index'
  end
end
