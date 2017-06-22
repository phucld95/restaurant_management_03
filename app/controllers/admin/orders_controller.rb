class Admin::OrdersController < ApplicationController
  before_action :logged_in_admin
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :check_for_cancel

  def index
    @orders_support = Supports::Order.new order: Order.all, param: params
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new order_params
    if @order.save
      flash[:success] = t "flash.order.create_success"
      redirect_to admin_order_path @order
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update_attributes order_params
      flash[:success] = t "flash.order.update_success"
      redirect_to admin_orders_path
    else
      render :edit
    end
  end

  def destroy
    if @order.destroy
      flash[:success] = t "flash.order.delete_success"
    else
      flash[:danger] = t "flash.order.delete_fail"
    end
    respond_to do |format|
      format.html{redirect_to :back}
      format.json{head :no_content}
    end
  end

  private
  def find_order
    @order = Order.find_by id: params[:id]
    t "admin_order.something_wrong" unless @order
  end

  def order_params
    params.require(:order).permit :code, :discount, :day, :time_in, :is_confirm,
      guest_attributes: [:id, :name], table_attributes: [:id, :capacity]
  end

  def check_for_cancel
    redirect_to admin_orders_path if params[:commit] == %w(Cancel)
  end
end
