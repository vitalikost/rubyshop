class CreateAttrproducts < ActiveRecord::Migration[5.1]
  def change
    create_table :attrproducts do |t|
      t.string :name

      t.timestamps
    end
  end
end
