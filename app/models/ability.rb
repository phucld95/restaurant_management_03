class Ability
  include CanCan::Ability

  def initialize user
    user ||= Admin.new
    alias_action :new, :edit, :create, :update, :destroy, to: :modify
    alias_action :new, :create, to: :add
    alias_action :index, :show, :edit, to: :view

    can :view, :all

    case user.admin_role
    when "administrator"
      can :manage, :all
    when "waiter"
      can :modify, [OrderDish, OrderCombo]
    when "receptionist"
      can :modify, [Order, OrderDish, OrderCombo]
    else
      can :update, [OrderDish, OrderCombo]
    end
  end
end
