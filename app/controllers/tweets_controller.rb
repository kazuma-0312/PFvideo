class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
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
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :youtube_url, :text).merge(user_id: current_user.id)
  end
end
