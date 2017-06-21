class Supports::AdminOrder
  attr_reader :data

  def initialize arg
    @data = arg
  end

  def get_data
    @data
  end
end
