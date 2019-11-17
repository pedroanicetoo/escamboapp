class AdminPolicy < ApplicationPolicy

  def new?
    user.role_br == 'full_access'
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
