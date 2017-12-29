class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
