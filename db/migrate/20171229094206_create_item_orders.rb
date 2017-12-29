class CreateItemOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :item_orders do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.timestamps
    end
  end
end
