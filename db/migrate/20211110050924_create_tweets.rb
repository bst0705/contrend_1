class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|

      t.integer :customer_id
      t.integer :impressions_count
      t.string :title
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
