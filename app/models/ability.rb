class Ability
  include CanCan::Ability

  def initialize user
    user ||= Admin.new
    alias_action :create, :update, :destroy, to: :modify

    can :read, :all

    case user.admin_role
    when :administrator
      can :manage, :all
    when :waiter
      can :modify, [Order, OrderDish, OrderCombo]
    when :receptionist
      can :modify, [Order, OrderDish, OrderCombo, Guest]
    end
  end
end
