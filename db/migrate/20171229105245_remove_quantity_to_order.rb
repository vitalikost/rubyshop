class RemoveQuantityToOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :quantity
  end
end
