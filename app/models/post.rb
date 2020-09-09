class Post < ApplicationRecord
  validates :body, presence: true

  has_many :comments
  has_many :likes

  belongs_to :user

  def self.get_friends_posts(user)
    posts = user.posts.to_a

    user.friends.each do |friend|
      friend.posts.each do |post|
        posts << post
      end
    end

    posts
  end
end
