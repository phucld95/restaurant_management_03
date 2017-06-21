class Supports::Combo
  attr_reader :combos

  def initialize arg
    @combos = arg
  end

  def combos
    @combos[:combo]
  end

  def combos_search
    search.result.page(@combos[:param][:page]).per_page Settings.limit
  end

  def search
    search = Combo.ransack @combos[:param][:q]
    search.sorts = %w(created_at desc name discount) if search.sorts.empty?
    search
  end
end
