class Supports::Order
  attr_reader :orders

  def initialize arg
    @orders = arg
  end

  def orders
    @orders[:order]
  end

  def orders_search
    search.result.page(@orders[:param][:page]).per_page Settings.max_result
  end

  def search
    search = Order.ransack @orders[:param][:q]
    search.sorts = %w(code) if search.sorts.empty?
    search
  end
end
