class Backoffice::AdminsController < BackofficeController
  before_filter :set_admin, :only => [:edit, :update, :destroy]
  after_filter :verify_authorized, :only => [:new, :destroy]
  after_filter  :verify_policy_scoped, :only => [:index]
  def index
    # @admins = Admin.all
    # exemplo de uso de scope criado no model
    # @admins = Admin.with_full_access
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      redirect_to backoffice_admins_path, notice:"O administrador (#{@admin.email}) foi cadastrado com sucesso"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @admin.update_attributes(params[:admin])
      redirect_to backoffice_admins_path, notice: "O administrador (#{@admin.email}) foi atualizado com sucesso"
    else
      render :edit
    end
  end

  def destroy
    authorize @admin
    admin_email = @admin.email
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "O administrador (#{admin_email}) foi excluído com sucesso"
    else
      reder :index
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin

    if password_blank?
        params[:admin].except!(:password, :password_confirmation)
    end

    if @admin.blank?
      params[:admin]
    else
      params[policy(@admin).permitted_attributes]
    end

  end

  def password_blank?
     params[:admin][:password].blank? &&
     params[:admin][:password_confirmation].blank?
   end

end
