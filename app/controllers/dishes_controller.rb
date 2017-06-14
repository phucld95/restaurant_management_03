class DishesController < ApplicationController
  before_action :find_dish, except: :index

  def index
    @search = Dish.ransack params[:q]
    @search.sorts = %w(name price) if @search.sorts.empty?
    @dishes = @search.result.page(params[:page]).per_page Settings.limit
  end

  def show
    @order_dish = current_order.order_dishes.new
  end

  private
  def find_dish
    @dish = Dish.find_by id: params[:id]
    flash[:danger] = t "flash.dish.find_fail" unless @dish
  end
end
