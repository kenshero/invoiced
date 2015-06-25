class AddAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :text
    add_column :users, :tel, :string
  end
end
