class Site::CategoriesController < SiteController
	def show
		@categories = Category.order_by_description
		@category = Category.friendly_id.find(params[:id])
		@ads = Ad.by_category(@category)
	end
end
	