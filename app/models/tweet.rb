class Tweet < ApplicationRecord

  attachment :tweet_image
  is_impressionable counter_cache: true

  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :impressions, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true


  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

end
