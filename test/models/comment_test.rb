require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  comment = Comment.new(body: "Comment body sample")
  comment.post = Post.new
  comment.user = User.new

  test "return body" do
    assert comment.body 
  end

  test "return post" do
    assert comment.post
  end

  test "return user" do
    assert comment.user
  end
end
