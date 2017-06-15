class GetOrderDetails
  def initialize param
    @order = param
  end

  def perform
    get_order_detail
  end

  private
  def get_order_detail
    @order_dishes = @order.order_dishes
    @order_combos = @order.order_combos
  end
end
