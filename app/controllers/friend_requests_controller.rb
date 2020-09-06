class FriendRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @requests = current_user.friend_requests
  end

  def create
    @user = User.find(params[:user_id])

    FriendRequest.new_request(@user, current_user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @request = FriendRequest.find(params[:id])

    FriendRequest.accept_request(@user, current_user) if params[:response]

    @request.destroy
    redirect_to friend_requests_path
  end
end
