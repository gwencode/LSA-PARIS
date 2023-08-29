class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    user ? user.admin : false
  end

  def create?
    new?
  end

  def edit?
    user ? user.admin : false
  end

  def update?
    edit?
  end

  def destroy?
    user ? user.admin : false
  end
end
