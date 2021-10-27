# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize (user)
    can :read, Advertisment

    return unless user.present?
      can [:read, :create], Advertisment
      can [:update, :destroy], Advertisment, user: user

    return unless user.role == "admin"
      can :manage, Advertisment
  end
end
