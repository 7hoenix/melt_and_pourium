class AddQuantityToItems < ActiveRecord::Migration
  def change
    add_column :items, :quantity, :integer, default: 0
  end
end
