class CategoriesController < ProductsController
  before_action :get_category, only: [:products]
  #這樣products action就可以拿到@category
  before_action :get_products, only: [:products]
  before_action :create_pagination, only: [:products]
  # 照理說create_pagination是private方法不能被繼承的class呼叫，
  # 但是ruby中直接呼叫方法名還可以呼叫得到。

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
