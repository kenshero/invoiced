class RenamePrice < ActiveRecord::Migration
  def change
  	 rename_column :payments, :price, :price_payment
  end
end
