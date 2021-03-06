class Backoffice::CategoriesController < BackofficeController
  before_filter :set_category, :only => [:edit, :update]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = CategoryService.create(params[:category])

    unless @category.errors.any?
       redirect_to backoffice_categories_path, notice:"A categoria (#{@category.description}) foi cadastrada com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(params[:category])
      redirect_to backoffice_categories_path, notice:"A categoria (#{@category.description}) foi atualizada com sucesso"
    else
      render :edit
    end
  end

  def set_category
    @category = Category.friendly.find(params[:id])
  end
end







