class ChangeColumnDefaultToContacts < ActiveRecord::Migration[5.2]
  def change
      change_column_default :contacts, :contact_genre, from: nil, to: "0"
      change_column_null :contacts, :contact_name, false, 0
      change_column_null :contacts, :contact_email, false, 0
      change_column_null :contacts, :contact_phone, false, 0
      change_column_null :contacts, :contact_genre, false, 0
      change_column_null :contacts, :contact_introduction, false, 0
  end
end
