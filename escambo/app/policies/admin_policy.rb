class AdminPolicy < ApplicationPolicy

  def new?
    user.role_br == 'full_access'
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
