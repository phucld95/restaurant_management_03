class ChangeColumnTimeIn < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :time_in, :string
  end
end
