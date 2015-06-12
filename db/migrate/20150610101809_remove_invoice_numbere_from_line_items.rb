class RemoveInvoiceNumbereFromLineItems < ActiveRecord::Migration
  def change
    remove_column :line_items, :invoice_number, :string
  end
end
