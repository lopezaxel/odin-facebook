require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  friend_request = FriendRequest.new(requester_id: 2)
  friend_request.user = User.new

  test "return requester_id" do
    assert friend_request.requester_id
  end

  test "return user" do
    assert friend_request.user
  end
end
