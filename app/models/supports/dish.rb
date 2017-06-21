class Supports::Dish
  attr_reader :dishes

  def initialize arg
    @dishes = arg
  end

  def dishes
    @dishes[:dish]
  end

  def dishes_search
    search.result.page(@dishes[:param][:page]).per_page Settings.limit
  end

  def search
    search = Dish.ransack @dishes[:param][:q]
    search.sorts = %w(name price) if search.sorts.empty?
    search
  end
end
