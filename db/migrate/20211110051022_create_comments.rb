class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.integer :customer_id
      t.integer :tweet_id
      t.integer :count
      t.text :comment

      t.timestamps
    end
  end
end
