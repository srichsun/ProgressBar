class SubcategoriesController < ApplicationController
  before_action :get_category, :get_subcategory, only: [:products]
  def products
  end

  private

  def get_category
  end

  def get_subcategory
  end
end
