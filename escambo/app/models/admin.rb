class Admin < ActiveRecord::Base
  #Constants
  ROLES = {:full_access => 0, :restricted_access => 1}

  # Scopes
  scope :with_full_access, -> { where(role: ROLES[:full_access]) }
  scope :with_restricted_access, -> { where(role: ROLES[:restricted_access]) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #Roles:
  #0 - full access
  #1 - restricted_access
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role

  def params_admin
    passwd = params[:admin][:password]
    passwd_confirmation = params[:admin][:password_confirmation]

    if passwd.blank? && passwd.confirmation.blank?
      params[:admin].except!(:password, :password_confirmation)
    end

  end
  # attr_accessible :title, :body

  def role_br
    if self.role == 0
     'full_access'
    else
     'restricted_access'
    end
  end

end
