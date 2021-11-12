class AddTweetImageToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :tweet_image, :string
  end
end
