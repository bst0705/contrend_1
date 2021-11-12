class ChangeImpressionsCountDefaultOnTweets < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tweets, :impressions_count, from: nil, to: "0"
  end
end
