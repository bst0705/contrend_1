class Customer::CommentsController < ApplicationController

  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = current_customer.comments.new(tweet_comment_params)
    comment.tweet_id = tweet.id
    if comment.save
      redirect_to tweet_path(tweet)
    else
      redirect_to tweet_path(tweet)
    end
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to tweet_path(params[:tweet_id])
  end

  private

  def tweet_comment_params
    params.require(:comment).permit(:comment)
  end

end
