class Customer::LikesController < ApplicationController
  
  def create
    tweet = Tweet.find(params[:tweet_id])
    like = current_customer.likes.new(tweet_id: tweet.id)
    like.save
    redirect_to tweet_path(tweet)
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    like = current_customer.likes.find_by(tweet_id: tweet.id)
    like.destroy
    redirect_to tweet_path(tweet)
  end
  
end
