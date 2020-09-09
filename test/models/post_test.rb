require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  post = Post.new
  post.user = User.new

  test "can't save without body" do
    assert_not post.save
  end

  test "returns comments" do
    assert post.comments
  end

  test "return user" do
    assert post.user
  end
end
