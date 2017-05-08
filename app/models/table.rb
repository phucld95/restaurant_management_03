class Table < ApplicationRecord
  has_many :orders, dependent: :destroy
  scope :get_table, ->a, b, c{
    where(
      "capacity >= ? AND id NOT IN (?)", a, Order.where(
        "day = ? AND time_in = ?", b, c
      ).select("table_id")
    )
  }
end
