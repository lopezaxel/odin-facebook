class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def self.delete_friend(user, friend)
    user.friends.delete(friend.id)
    friend.friends.delete(user.id)
  end

  def self.add_friend(user, friend)
    user.friends << friend
    friend.friends << user
  end
end
