class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|

      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.string :contact_genre
      t.text :contact_introduction

      t.timestamps
    end
  end
end
