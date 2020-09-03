class RemoveAcceptedFriendRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :friend_requests, :accepted
  end
end
