class CreateAttrproductvalues < ActiveRecord::Migration[5.1]
  def change
    create_table :attrproductvalues do |t|
      t.integer :attrproduct_id
      t.string :attrvalue

      t.timestamps
    end
  end
end
