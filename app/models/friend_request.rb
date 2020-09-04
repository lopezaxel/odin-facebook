class FriendRequest < ApplicationRecord
  belongs_to :user

  def self.new_request(user, requester)
    request = user.friend_requests.build(requester_id: requester.id)
    request.save
  end

  def self.accept_request(user, requester)
    Friendship.add_friend(user, requester) 
  end
end
