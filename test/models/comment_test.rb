require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "save failed without comment" do
  	user = users(:user_1)
  	comment = user.comments.new
  	comment.save
  	assert_equal "can't be blank", comment.errors[:comment].first
  end


end
