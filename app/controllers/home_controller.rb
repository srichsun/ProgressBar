class HomeController < ApplicationController

  PRODUCTS_PER_PAGE_COUNT = 20

  def index
    @ad = {
      title: "Advmeds Design",
      description: "Best Clinic reservation system",
      action_title: "more"
    }

    @first_page_number = 1
    @last_page_number = Product.count / PRODUCTS_PER_PAGE_COUNT

    @products = Product.all
    @current_page_number = params[:current_page] ? params[:current_page].to_i : 1
    @products = @products.offset((@current_page_number - 1) * PRODUCTS_PER_PAGE_COUNT).limit(PRODUCTS_PER_PAGE_COUNT)
  end
end
