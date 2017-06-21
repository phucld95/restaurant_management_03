class CreateHumen < ActiveRecord::Migration[5.0]
  def change
    create_table :humen do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :phone_num
      t.string :password_digest
      t.integer :admin_role

      t.timestamps
    end
  end
end
