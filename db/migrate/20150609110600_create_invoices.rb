class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string  :invoice_number
      t.integer :total
      t.date	:issue_date
      t.date	:due_date
      t.timestamps null: false
    end
  end
end
