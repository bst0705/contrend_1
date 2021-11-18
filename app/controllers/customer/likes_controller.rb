class Customer::LikesController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    tweet = Tweet.find(params[:tweet_id])
    like = current_customer.likes.build(tweet_id: params[:tweet_id])
    like.save
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    tweet = Tweet.find(params[:tweet_id])
    like = Like.find_by(tweet_id: params[:tweet_id], customer_id: current_customer.id)
    like.destroy
  end

end
