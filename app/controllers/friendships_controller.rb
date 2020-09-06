class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @user = User.find(params[:user_id])

    Friendship.delete_friend(@user, current_user)

    redirect_to @user
  end
end
