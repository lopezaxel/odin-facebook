class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])

    @user.friends << current_user
    current_user.friends << @user
  end

  def destroy
    @user = User.find(params[:user_id])

    @user.friends.delete(current_user.id)
    current_user.friends.delete(@user.id)

    redirect_to @user
  end
end
