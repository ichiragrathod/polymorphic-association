# frozen_string_literal: true

class EventPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    @user.has_any_role? :user, :admin
  end

  def destroy?
    @user.has_role? :admin
  end

  def edit?
    @user.has_role? :admin
  end

  def update?
    @user.has_role? :admin
  end
end
