class FriendRequestsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @request = @user.friend_requests.build(requester_id: current_user.id)

    @request.save
  end

  def destroy
    @user = User.find(params[:user_id])
    @request = Request.find(params[:request_id])
    @response = params[:response]

    # Call friendships#create(@user) if @response 

    @response.destroy
  end
end
