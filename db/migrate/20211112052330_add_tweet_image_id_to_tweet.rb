class AddTweetImageIdToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :tweet_image_id, :string
  end
end
