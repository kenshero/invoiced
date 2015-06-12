class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :invoice_number
      t.string :product
      t.string :qty
      t.string :price
      t.references :invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
