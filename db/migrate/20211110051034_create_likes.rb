class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|

      t.integer :customer_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end
