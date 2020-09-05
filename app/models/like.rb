class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def self.user_liked_post?(user, post)
    post.likes.exists?(user_id: user.id)
  end

  def self.user_like(user, post)
    post.likes.find_by(user_id: user.id)
  end
end
