class RemoveIdLineFromLineItems < ActiveRecord::Migration
  def change
    remove_column :line_items, :id_line, :string
  end
end
