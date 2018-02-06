class CategoriesController < ProductsController
  before_action :get_category, only: [:products]
  #這樣products action就可以拿到@category
  before_action :get_products, only: [:index, :products]
  before_action :create_pagination, only: [:index, :products]

  def products
    # @products = @category.subcategories.first.product
    # 加入has_many_through 關聯後就可以這樣用
  end

  private
    def get_category
      @category = Category.find_by_id(params.permit([:category_id])[:category_id])
    end

    def get_products
      @products = @category.products
    end
end
