module AdminLoadOrder
  def load_support_combos
    @support = Supports::AdminOrder.new order: find_order, combo: load_combo
  end

  def load_support_dishes
    @support = Supports::AdminOrder.new order: find_order, dish: load_dish
  end

  def find_order
    Order.find_by id: params[:order_id]
  end

  def find_order_combo
    param = params[:id]
    order = find_order
    @order_combo =
      if order
        order.order_combos.find_by id: param
      else
        OrderCombo.find_by id: param
      end
  end

  def load_combo
    @combos = Combo.all.map{|p| [p.name, p.id]}
  end

  def find_order_dish
    param = params[:id]
    @order_dish =
      if @order
        @order.order_dishes.find_by id: param
      else
        OrderDish.find_by id: param
      end
  end

  def load_dish
    @dishes = Dish.all.map{|p| [p.name, p.id]}
  end
end
