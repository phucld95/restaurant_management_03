class Order < ApplicationRecord
  belongs_to :guest
  belongs_to :table

  has_many :order_dishes

  def subtotal
    order_dishes.map{|order_dish| order_dish.valid? ?
      (order_dish.quantity * order_dish.price) : 0}.sum
  end
end
