class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      @user = @comment.user
      ActionCable.server.broadcast 'comment_channel', content: @comment, user: @user
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
