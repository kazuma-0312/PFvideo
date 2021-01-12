class TweetsController < ApplicationController

  def index
    @tweets = Tweet.includes(:user)
  end
  
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    url = params[:tweet][:youtube_url]
    url = url.last(11)
    @tweet.youtube_url = url
    if @tweet.save
      redirect_to root_path
    else  
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if current_user.id == @tweet.user_id
      if @tweet.destroy
        redirect_to root_path
      else
        render :show, alert: "Failed to delete"
      end
    else
      redirect_to root_path
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :youtube_url, :text).merge(user_id: current_user.id)
  end
end
