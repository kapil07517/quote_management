require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "failed to create user without/blank email" do
  	user = User.new(email: "", password: "password", password_confirmation: "password")
  	user.save
  	assert_equal "can't be blank", user.errors[:email].first
  end

  test "failed to create user without/blank password" do
  	user = User.new(email: "tester@gmail.com", password: "", password_confirmation: "password")
  	user.save
  	assert_equal "can't be blank", user.errors[:password].first
  end

  test "failed to create user without/blank password_confirmation" do
  	user = User.new(email: "tester@gmail.com", password: "password", password_confirmation: "")
  	user.save
  	assert_equal "doesn't match Password", user.errors[:password_confirmation].first
  end

  test "failed to create user when email already exists" do
  	user = users(:user_1)
  	new_user = User.new(email: "test@gmail.com", password: "password", password_confirmation: "password")
  	new_user.save
  	assert_equal "has already been taken", new_user.errors[:email].first
  end

  test "failed to create user with invalid email address" do
  	user = User.new(email: "email", password: "password", password_confirmation: "password")
  	user.save
  	assert_equal "is invalid", user.errors[:email].first
  end

  test "failed to create user with mismatch the passwor and password_confirmation" do
  	user = User.new(email: "tester@gmail.com", password: "password", password_confirmation: "password2")
  	user.save
  	assert_equal "doesn't match Password", user.errors[:password_confirmation].first
  end
end
