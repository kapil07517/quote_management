require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	include Devise::TestHelpers


  test "renders show" do
  	user = users(:user_1)
  	sign_in user
  	get :show, params: { id: user }
  	assert_response :success
  	assert_template :show
  end
end
