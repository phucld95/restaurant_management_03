module AdminLoadOrder
  def load_support_combos
    @support = Supports::AdminOrder.new order: find_order, combo: load_combo,
      combo_select: load_combo_select
  end

  def load_support_dishes
    @support = Supports::AdminOrder.new order: find_order, dish: load_dish,
      dish_select: load_dish_select
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

  def load_dish_select
    Dish.all.collect {|p| [ p.name, p.id ] }
  end

  def load_combo_select
    Combo.all.collect {|p| [ p.name, p.id ] }
  end
end
