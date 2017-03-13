class Dish < ApplicationRecord
  has_many :category_dishes
  has_many :combo_dishes
  has_many :order_dishes
end
