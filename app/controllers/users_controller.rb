class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    # user.avatar.attach(params[:avatar])
  end

  def update

  end
end
