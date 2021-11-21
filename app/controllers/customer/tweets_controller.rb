class Customer::TweetsController < ApplicationController
  before_action :correct_tweet,only: [:edit]
  before_action :authenticate_customer!, except: [:index,:destroy]

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.customer_id = current_customer.id
    @tweet.save
    redirect_to tweets_path
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to tweet_path(@tweet.id)
  end

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
    redirect_to tweets_path
  end

  def correct_tweet
        @tweet = Tweet.find(params[:id])
    unless @tweet.customer.id == current_customer.id
      redirect_to customer_path
    end
  end


  private

  def tweet_params
    params.require(:tweet).permit(:impressions_count, :title, :body, :tweet_image)
  end

end
