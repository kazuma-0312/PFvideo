class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    Like.create(user_id: current_user.id, tweet_id: params[:id])
    redirect_to tweet_path
  end

  def destroy
    Like.find_by(user_id: current_user.id, tweet_id: params[:id]).destroy
    redirect_to tweet_path
  end
end
