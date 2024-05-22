class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :item_type
      t.integer :stock
      t.decimal :price
      t.string :thumbnail
      t.string :description

      t.timestamps
    end
  end
end
