class Admin < ActiveRecord::Base
  scope :with_full_access, -> { where(role: 0) }
  # def self.with_full_access
  #   where(role: 0)
  # end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #Roles:
  #0 - full access
  #1 - restricted_access
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role
  # attr_accessible :title, :body

  def role_br
    if self.role == 0
     'Acesso Completo'
    else
     'Acesso Restrito'
    end
  end

end
