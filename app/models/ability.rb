class Ability
  include CanCan::Ability

  def initialize user
    user ||= Admin.new
    alias_action :create, :update, :destroy, to: :modify

    case user.admin_role
      when :administrator
        can :manage, :all
      when :waiter
        can :modify, [Order, OrderDish, OrderCombo]
        can :read, :all
      when :receptionist
        can :modify, [Order, OrderDish, OrderCombo]
        can :read, :all
      else
        can :read, :all
    end
  end
end
