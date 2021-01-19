class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    @user = @comment.user
      ActionCable.server.broadcast 'comment_channel', content: @comment, user: @user if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
