class Supports::Category
  attr_reader :categories

  def initialize arg
    @argument = arg
  end

  def categories
    @argument[:categories]
  end

  def categories_search
    search.result.page(@argument[:param][:page]).per_page Settings.limit
  end

  def search
    search = Category.ransack @argument[:param][:q]
    search.sorts = %w(created_at desc name) if search.sorts.empty?
    search
  end
end
