class OrderDishesController < ApplicationController
  before_action :set_order, only: [:create, :update, :destroy]
  before_action :set_dish, only: [:update, :destroy]

  def create
    @order_dish = @order.order_dishes.new order_dish_params
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order_dish.update_attributes order_dish_params
    get_order_detail
  end

  def destroy
    @order_dish.destroy
    get_order_detail
  end

  private
  def set_dish
    @order_dish = @order.order_dishes.find_by id: params[:id]
  end

  def set_order
    @order = current_order
  end

  def get_order_detail
    @order_dishes = @order.order_dishes
    @order_combos = @order.order_combos
  end

  def order_dish_params
    params.require(:order_dish).permit :quantity, :id, :dish_id
  end
end
