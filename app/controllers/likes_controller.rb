class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)

    @like.save

    redirect_to root_path
  end

  def destroy
    @like = Like.find(params[:id])

    @like.destroy

    redirect_to root_path
  end

  private

  def like_params
    params.permit(:user_id, :post_id)
  end
end
