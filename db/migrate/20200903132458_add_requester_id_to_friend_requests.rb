class AddRequesterIdToFriendRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :friend_requests, :requester_id, :integer
  end
end
