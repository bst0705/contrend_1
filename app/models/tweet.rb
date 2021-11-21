class Tweet < ApplicationRecord

  attachment :tweet_image
  is_impressionable counter_cache: true

  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

end
