class CreateAttributeValues < ActiveRecord::Migration[5.1]
  def change
    create_table :attribute_values do |t|
      t.integer :attr_id
      t.string :val

      t.timestamps
    end
  end
end
