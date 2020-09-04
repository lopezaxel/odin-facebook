class PostsController < ApplicationController
  def index
    @posts = current_user.posts

    current_user.friends.each do |friend|
      friend.posts.each do |post|
        @posts << post
      end
    end
  end
end
