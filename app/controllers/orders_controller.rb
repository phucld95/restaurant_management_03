class OrdersController < ApplicationController
  def index
    info = params[:order]
    if info
      order = Order.find_by code: info[:code]
      if order && order.guest.email == info[:email]
        session[:order_id] = order.id
        flash[:success] = t "flash.order.find_order"
        redirect_to cart_path
      else
        flash[:danger] = t "flash.order.cant_find_order"
        redirect_to orders_path
      end
    end
  end

  def show
    @order_dishes = current_order.order_dishes
    @order_combos = current_order.order_combos
  end

  def create
    params[:guest_id] = session[:guest]["id"]
    session.delete :order_id if current_order.code.present?
    if order_params[:table_id].blank?
      session.delete :order_id
      redirect_to cart_path
    else current_order.id.blank?
      @order = current_order
      @order.save
      session[:order_id] = @order.id
      current_order.update_attributes order_params
      flash[:success] = t "flash.order.create_success"
      render json: {path1: order_path(@order).to_s}
    end
  end

  private
  def order_params
    params.permit :table_id, :day, :time_in, :guest_id, :code
  end
end
