class OrderDish < ApplicationRecord
  enum status: [:no_need, :needing, :cooking, :cooked, :served, :cancel]

  belongs_to :order
  belongs_to :dish

  validates :quantity, presence: true,
    numericality: {only_integer: true, greater_than: 0}
  validate :dish_present
  validate :order_present

  before_save :finalize

  def total_price
    price * quantity
  end

  private
  def dish_present
    errors.add :dish, t("order.not_valid_or_not_active") unless dish
  end

  def order_present
    errors.add :order, t("order.not_valid_value") unless order
  end

  def finalize
    self[:price] = dish.price
    self[:total_price] = quantity * self[:price]
  end
end
