class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :date
      t.string :description
      t.integer :payment_method
      t.integer :price
      t.integer :invoice_id
      t.references :invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
