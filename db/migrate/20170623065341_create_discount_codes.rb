class CreateDiscountCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :discount_codes do |t|
      t.string :code
      t.integer :discount
      t.string :status

      t.timestamps
    end
  end
end
