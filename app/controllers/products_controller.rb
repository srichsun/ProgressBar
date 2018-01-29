class ProductsController < ApplicationController

  PRODUCTS_PER_PAGE_COUNT = 20

  def index
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

    @products = Product.all
    @current_page_number = params[:current_page] ? params[:current_page].to_i : 1
    @products = @products.offset((@current_page_number - 1) * PRODUCTS_PER_PAGE_COUNT).limit(PRODUCTS_PER_PAGE_COUNT)
  end

  def new
    @note = flash[:note]
  end

  def create

    # 把form送來的值存assign創造instance
    # Product.create(
    #   name:        params[:name],
    #   description: params[:description],
    #   image_url:   params[:image_url],
    #   price:       params[:price]
    # )
    #
    # 以上其實就是
    # Product.create(params)
    # 但是rails有防護機制，要特別允許的值才會讓你過，要像以下
    product = Product.create(product_permit)

    flash[:note] = "from create" #flash讓action之間傳遞值
    redirect_to action: :new     #同一個controller下
  end

  def product_permit
    params.permit([:name, :description, :image_url, :price])
  end
end
