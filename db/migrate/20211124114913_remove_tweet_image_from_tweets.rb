class RemoveTweetImageFromTweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :tweet_image, :string
  end
end
