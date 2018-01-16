class CreateAttributeProductValues < ActiveRecord::Migration[5.1]
  def change
    create_table :attribute_product_values do |t|
      t.integer :product_id
      t.integer :attribute_value_id

      t.timestamps
    end
  end
end
