class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, tweet_id: params[:id])
    redirect_to tweet_path
  end


end
