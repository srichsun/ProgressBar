class CategoriesController < ProductsController
  before_action :get_category, only: [:products]
  #這樣products action就可以拿到@category

  def products
    # @products = @category.subcategories.first.product
    # 加入has_many_through 關聯後就可以這樣用
    @products = @category.products
  end

  def get_category
    @category = Category.find_by_id(params.permit([:category_id])[:category_id])
  end
end
