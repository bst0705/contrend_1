class Tweet < ApplicationRecord

  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  attachment :tweet_image
  is_impressionable counter_cache: true

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

end
