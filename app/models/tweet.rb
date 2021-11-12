class Tweet < ApplicationRecord

  belongs_to :customer

  attachment :tweet_image
  is_impressionable counter_cache: true

end
