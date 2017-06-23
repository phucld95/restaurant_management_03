class Admin::OrderCombosController < ApplicationController
  include AdminLoadOrder
  before_action :logged_in_admin
  before_action :load_support_combos
  before_action :find_order_combo

  load_and_authorize_resource

  def new
    @order_combo = OrderCombo.new
  end

  def create
    order = @support.load_data[:order]
    @order_combo = order.order_combos.new order_combo_params
    if order.save
      flash[:success] = t "admin_order.success_add"
      redirect_to admin_order_path order
    else
      flash[:danger] = t "admin_order.something_wrong"
      redirect_to new_admin_order_order_combo_path
    end
  end

  def edit
  end

  def update
    if @order_combo.update_attributes order_combo_params
      flash[:success] = t "admin_order.success_update"
      redirect_to admin_order_path @support.load_data[:order]
    else
      flash[:danger] = t "admin_order.something_wrong"
      redirect_to edit_admin_order_order_combo_path
    end
  end

  def destroy
    order = @support.load_data[:order]
    if order
      order_combo = order.order_combos
      if order_combo.delete @order_combo
        flash[:success] = t "admin_order.success_delete"
        redirect_to admin_order_path order
      else
        flash[:danger] = t "admin_order.something_wrong"
      end
    end
  end

  private
  def order_combo_params
    params.require(:order_combo).permit :combo_id, :quantity
  end
end
