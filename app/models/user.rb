class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friend_requests
  has_many :friendships
  has_many :friends, through: :friendships

  def is_my_friend?(user)
    self.friends.exists?(user.id)
  end

  def pending_request?(user)
    self.friend_requests.exists?(requester_id: user.id)
  end
end
