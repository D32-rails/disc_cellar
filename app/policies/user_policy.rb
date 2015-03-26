class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(current_user, user)
      @current_user = current_user
      @user = user
    end

    def resolve
      if user.admin? || logged_in?
        scope.all
      else
        scope.where(published: true)
      end
    end

    def logged_in?
      @user == (@current_user)
    end
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def logged_in?
    @user.id == record.id
  end
end
