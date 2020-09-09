class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :post

  def created_by_user?(user)
    self.user_id == user.id
  end
end
