class OrderCombosController < ApplicationController
  before_action :set_order, only: [:create, :update, :destroy]
  before_action :set_combo, only: [:update, :destroy]

  def create
    @order_combo = @order.order_combos.new order_combo_params
    unless @order.save
      flash[:danger] = t "flash.combo.search_fail"
    end
    session[:order_id] = @order.id
  end

  def update
    @order_combo.update_attributes order_combo_params
    get_order_detail
  end

  def destroy
    @order_combo.destroy
    get_order_detail
  end

  private
  def set_order
    @order = current_order
  end

  def set_dish
    @order_combo = @order.order_combos.find_by id: params[:id]
  end

  def get_order_detail
    @order_dishes = @order.order_dishes
    @order_combos = @order.order_combos
  end

  def order_combo_params
    params.require(:order_combos).permit :quantity, :id, :combo_id
  end
end
