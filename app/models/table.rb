class Table < ApplicationRecord
  has_many :orders, dependent: :destroy
  scope :get_table, ->a, b, c, d{
    where(
      "capacity >= ? AND id NOT IN (?)", a, Order.where(
        "day = ? AND time(time_in) < time(?)
        AND time(time_in) > time(?)", b, c, d
      ).select("table_id")
    )
  }
end
