class Order < ApplicationRecord
  belongs_to :guest
  belongs_to :table

  has_many :order_dishes
end
