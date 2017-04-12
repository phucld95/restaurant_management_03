class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :guest, foreign_key: true
      t.references :table, foreign_key: true
      t.string :code
      t.date :time_in
      t.date :time_out
      t.boolean :isConfirm, default: false
      t.integer :discount

      t.timestamps
    end
  end
end
