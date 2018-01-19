class AddNameToAttributeValue < ActiveRecord::Migration[5.1]
  def change
    add_column :attribute_values, :name, :string
  end
end
