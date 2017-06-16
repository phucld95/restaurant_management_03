class Supports::Combo
  attr_reader :combo

  def initialize arg
    @combos = arg
  end

  def combo
    @combos
  end

  def combos params
    search(params).result.page(params[:page]).per_page Settings.limit
  end

  def search params
    search = Combo.ransack params[:q]
    search.sorts = %w(created_at desc name discount) if search.sorts.empty?
    search
  end
end
