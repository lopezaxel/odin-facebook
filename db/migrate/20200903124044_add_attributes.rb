class AddAttributes < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :body, :text
    add_column :comments, :body, :text 
    add_column :users, :name, :string
    add_column :users, :username, :string
  end
end
