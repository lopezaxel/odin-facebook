class CreateFriendRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_requests do |t|
      t.integer :user_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
