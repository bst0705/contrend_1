class Customer::RanksController < ApplicationController

  def dayrank
    @tweet_like_ranks = Tweet.find(Like.group(:tweet_id).includes(:customer).where(created_at: Time.current.all_day).order('count(tweet_id) desc').limit(5).pluck(:tweet_id))
  end

  def weekrank
    @tweet_like_ranks = Tweet.find(Like.group(:tweet_id).includes(:customer).where(created_at: Time.current.all_week).order('count(tweet_id) desc').limit(5).pluck(:tweet_id))
  end

  def monthrank
    @tweet_like_ranks = Tweet.find(Like.group(:tweet_id).includes(:customer).where(created_at: Time.current.all_month).order('count(tweet_id) desc').limit(5).pluck(:tweet_id))
  end

  def yearrank
    @tweet_like_ranks = Tweet.find(Like.group(:tweet_id).includes(:customer).where(created_at: Time.current.all_year).order('count(tweet_id) desc').limit(5).pluck(:tweet_id))
  end

end
