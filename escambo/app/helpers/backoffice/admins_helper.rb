module Backoffice::AdminsHelper
  OptionsForRoles = Struct.new(:id, :description)

  def option_for_roles
    roles = Admin.select(:role).uniq
    roles.each.map do |value|
      if value.role == 0
        OptionsForRoles.new(value.role, 'full_access')
      else
        OptionsForRoles.new(value.role, 'restricted_access')
      end
    end
  end
  # [0] #<Struct:OptionsForRoles:0x55dcc92d3dd0 description = "full_access", id = 0>
  # [1] #<Struct:OptionsForRoles:0x55dcc92d3d30 description = "restricted_access", id = 1>
end
