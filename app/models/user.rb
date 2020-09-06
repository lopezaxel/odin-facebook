class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  after_create :send_welcome_email
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_one_attached :image

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friend_requests
  has_many :friendships
  has_many :friends, through: :friendships

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.name = auth.info.name
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def is_my_friend?(user)
    self.friends.exists?(user.id)
  end

  def pending_request?(user)
    self.friend_requests.exists?(requester_id: user.id)
  end

  private

    def send_welcome_email
      UserMailer.with(user: self).welcome_email.deliver_now
    end
end
