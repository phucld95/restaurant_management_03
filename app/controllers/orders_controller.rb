class OrdersController < ApplicationController
  def show
    @order_dishes = current_order.order_dishes
  end
end
