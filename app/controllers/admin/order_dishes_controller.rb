class Admin::OrderDishesController < ApplicationController
  include AdminLoadOrder
  before_action :logged_in_admin
  before_action :load_support_dishes
  before_action :find_order_dish

  load_and_authorize_resource

  def new
    @order_dish = OrderDish.new
  end

  def create
    order = @support.load_data[:order]
    @order_dish = order.order_dishes.new order_dish_params
    if order.save
      flash[:success] = t "admin_order.success_add"
      redirect_to admin_order_path order
    else
      redirect_to new_admin_order_order_dish_path
    end
  end

  def edit
  end

  def update
    if @order_dish.update_attributes order_dish_params
      flash[:success] = t "admin_order.success_update"
      redirect_to admin_order_path @support.load_data[:order]
    else
      redirect_to edit_admin_order_order_dish_path
    end
  end

  def destroy
    order = @support.load_data[:order]
    if order
      order_dish = order.order_dishes
      if order_dish.delete @order_dish
        flash[:success] = t "admin_order.success_delete"
        redirect_to admin_order_path order
      else
        flash[:danger] = t "admin_order.something_wrong"
      end
    end
  end

  private
  def order_dish_params
    params.require(:order_dish).permit :dish_id, :order_id, :quantity
  end
end
