class Admin::TweetsController < ApplicationController
  before_action :if_not_admin

  def index
    @tweets = Tweet.order(updated_at: :desc).page(params[:page]).per(5)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @tweet_comment = Comment.new
    impressionist(@tweet, nil, unique: [:ip_address])
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to admin_tweets_path
  end

end
