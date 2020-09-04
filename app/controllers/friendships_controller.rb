class FriendshipsController < ApplicationController
  def destroy
    @user = User.find(params[:user_id])

    Friendship.delete_friend(@user, current_user)

    redirect_to @user
  end
end
