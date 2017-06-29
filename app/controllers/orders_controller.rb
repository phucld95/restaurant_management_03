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
    order_dish = current_order.order_dishes
    @order_dishes =
      if order_dish.blank?
        nil
      else
        order_dish
      end
    @order_combos = current_order.order_combos
    @order_dishes = nil if @order_dishes.blank?
  end

  def create
    params[:guest_id] = session[:guest]["id"]
    if current_order.table_id
      session.delete :order_id if current_order.code.present?
      redirect_to cart_path
    else
      @order = current_order
      @order.save
      session[:order_id] = @order.id
      @order.update_attributes order_params
      flash[:success] = t "flash.order.create_success"
      UserCreateOrderNotifierMailer.send_email(@order).deliver
      render json: {path: cart_path}
    end
  end

  private
  def order_params
    params.permit :table_id, :day, :time_in, :guest_id
  end

  def find_guest code
    @guest = Guest.find_by code: code
  end
end
