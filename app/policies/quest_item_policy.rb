# frozen_string_literal: true
class QuestItemPolicy < ApplicationPolicy
  # def index?
  #   true
  # end
  #
  # def create?
  #   !user.child?
  # end
  #
  # def update?
  #   !user.child? && show?
  # end
  #
  # def destroy?
  #   !user.child? && show?
  # end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
