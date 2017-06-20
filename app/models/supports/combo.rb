class Supports::Combo
  attr_reader :combos

  def initialize arg
    @combos = arg
  end

  def combos
    @combos
  end

  def combos_search params
    search(params).result.page(params[:page]).per_page Settings.limit
  end

  def search params
    search = Combo.ransack params[:q]
    search.sorts = %w(created_at desc name discount) if search.sorts.empty?
    search
  end
end
