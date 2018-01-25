class HomeController < ApplicationController

  PRODUCTS_COUNT = 80
  PRODUCTS_PER_PAGE_COUNT = 20

  def index
    @ad = {
      title: "Advmeds Design",
      description: "Best Clinic reservation system",
      action_title: "more"
    }

    @first_page_number = 1
    @last_page_number = PRODUCTS_COUNT/PRODUCTS_PER_PAGE_COUNT

    @products = []
    (1..PRODUCTS_COUNT).each do |index|
      product =
      {
        id: "#{index}",
        name: "ocean",
        description: "beautiful ocean",
        image_url: "https://static.pexels.com/photos/128458/pexels-photo-128458.jpeg"
      }

      @products << product
    end

    # params gets string so needs to_i.
    # When at homeapge so params[:current_page] would be nil,
    # then current_page_number would be -1, would show the last page,
    # which is wrong, so need to set current_page is 1
    @current_page_number = params[:current_page] ? params[:current_page].to_i : 1
    @products = @products[(@current_page_number-1)*PRODUCTS_PER_PAGE_COUNT, PRODUCTS_PER_PAGE_COUNT]
  end
end
