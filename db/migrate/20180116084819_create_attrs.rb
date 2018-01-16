class CreateAttrs < ActiveRecord::Migration[5.1]
  def change
    create_table :attrs do |t|
      t.string :name
      t.timestamps
    end
  end
end
