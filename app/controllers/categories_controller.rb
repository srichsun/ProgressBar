class CategoriesController < ApplicationController
  before_action :get_category, only: [:products]
  #這樣products action就可以拿到@category
  PRODUCTS_PER_PAGE_COUNT = 20

  def products
    # @products = @category.subcategories.first.product
    # 加入has_many_through 關聯後就可以這樣用
    @products = @category.products

    @ad = {
      title: "Advmeds Design",
      description: "Best Clinic reservation system",
      action_title: "more"
    }

    @first_page_number = 1
    @last_page_number = Product.count / PRODUCTS_PER_PAGE_COUNT
    if (Product.count % PRODUCTS_PER_PAGE_COUNT)
      @last_page_number += 1
    end

    @categories = Category.all

    @current_page_number = params[:current_page] ? params[:current_page].to_i : 1
    @products = @products.offset((@current_page_number - 1) * PRODUCTS_PER_PAGE_COUNT).limit(PRODUCTS_PER_PAGE_COUNT)
  end

  def get_category
    @category = Category.find_by_id(params.permit([:category_id])[:category_id])
  end
end
