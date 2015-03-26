class DvdPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.member?
        scope.where(published: true)
      else
        scope.where(published: true)
      end
    end
  end

  def new?
    create?
  end

  def create?
    user.admin?
  end

  def show?
    user.admin? || user.member?
  end

  def edit?
    update?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def publish
    @user.admin?
  end
end
