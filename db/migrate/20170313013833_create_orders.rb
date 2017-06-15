class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :guest, foreign_key: true
      t.references :table, foreign_key: true
      t.date :day
      t.string :code
      t.integer :time_in
      t.boolean :is_confirm, default: false
      t.integer :discount

      t.timestamps
    end
  end
end
