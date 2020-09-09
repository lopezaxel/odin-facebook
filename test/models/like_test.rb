require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  like = Like.new
  like.user = User.new
  like.post = Post.new

  test "return user" do
    assert like.user
  end

  test "return post" do
    assert like.post
  end
end
