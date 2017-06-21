class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :price
      t.string :image
      t.string :description
      t.boolean :is_available

      t.timestamps
    end
  end
end
