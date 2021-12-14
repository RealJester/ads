# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize (user)
    can :read, Advertisment

    return unless user.present?
    can [:read, :create], Advertisment
    can :update, Advertisment, state: ["drafted", "rejected"], user: user
    can :destroy, Advertisment, state: ["in_considered", "approved", "drafted", "rejected"], user: user

    return unless user.role == "admin"
      can :manage, Advertisment, state: ["approved", "in_considered", "published", "archived"]
      can :manage, User
  end
end
