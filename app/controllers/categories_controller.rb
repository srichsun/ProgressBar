class CategoriesController < ApplicationController
  before_action :get_category, only: [:products]
  #這樣products action就可以拿到@category

  def products

  end

  def get_category
    @category = Category.find_by_id(params.permit([:category_id])[:category_id])
  end
end
