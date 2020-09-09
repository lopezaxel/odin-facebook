require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  friendship = Friendship.new
  friendship.user = User.new
  friendship.friend = User.new
  
  test "return user" do
    assert friendship.user
  end

  test "return friend" do
    assert friendship.friend
  end
end
