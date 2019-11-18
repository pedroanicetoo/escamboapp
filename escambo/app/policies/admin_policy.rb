class AdminPolicy < ApplicationPolicy

  def new?
    user.role_br == 'full_access'
  end

  def edit?
    user.role_br == 'full_access'
  end

  def permitted_attributes
    if user.role_br == 'full_access'
      [:name, :email, :role, :password, :password_confirmation]
    else
      [:name, :email, :password, :password_confirmation]
    end
  end

  class Scope < Scope
    def resolve
      if user.role == 0
        scope.all
      else
        scope.with_restricted_access
      end
    end
  end
end
