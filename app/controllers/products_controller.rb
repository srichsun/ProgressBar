class ProductsController < ApplicationController
  # 新增修改刪除都要登入才能造訪
  before_action :redirect_to_root_if_not_logged_in, except: [:show, :index, :products]

  # 因為categoriescontroller#products跟ProductsController#indec程式碼幾乎一樣。
  # 把ProductsController#indec裡面的code包成method，
  # 然後categoriescontroller再繼承ProductsController
  # 這樣categoriescontroller的products方法就可以重複使用這些method
  before_action :prepare_index, only: [:index, :products]
  before_action :get_products, only: [:index, :products]
  before_action :create_pagination, only: [:index, :products]

  PRODUCTS_PER_PAGE_COUNT = 20

  def show
    @product = Product.find_by_id(params[:id])
  end

  def index
  end

  def new
    @product = Product.new
  end

  def create
    image = params[:product][:image]
    if image
      image_url = save_file(image)
    end
    product = Product.create(product_permit.merge({image_url: image_url}))

    flash[:notice] = "successfully created" #flash讓action之間傳遞值
    redirect_to action: :new     #同一個controller下
  end

  def edit
    @product = Product.find_by_id(params[:id])
    if @product.blank?
      redirect_to action: :index
      return # redirect_to 後面會繼續執行，這樣更乾淨
    end
  end

  def update
    product = Product.find(params[:id])
    image = params[:product][:image]
    if image
      image_url = save_file(image)
      product.update(product_permit.merge({image_url: image_url}))
    else
      product.update(product_permit)
    end

    flash[:notice] = 'successfully updated'
    redirect_to action: :edit
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy

    redirect_to action: :index
  end

  private
    def product_permit
      params.require(:product).permit([:name, :description, :price, :subcategory_id])
      # 進來的時候，有image欄位，可是不能加在這邊
      # 因為你加在這邊image值過了，create時候就會用
      # 然而product欄位名稱是image_url，不是image，就會出錯。

    end

    def save_file(newfile)
      dir_url = Rails.root.join('public', 'uploads/products')
      FileUtils.mkdir_p(dir_url) unless File.directory?(dir_url) #到/public/uploads創products資料夾
      file_url = dir_url + newfile.original_filename
      File.open(file_url, 'w+b') do |file| # 用w+, binary方式開
        file.write(newfile.read ) # 打圖片存到/public/uploads
      end

      return '/uploads/products/' + newfile.original_filename #加上圖片名稱變成完整圖片路徑
      # chrome - network - 找到圖片 - general 可以看到圖片路徑
      # Request URL:http://localhost:3000/uploads/products/pic.jpg
    end

    def prepare_index
      create_ad
      get_current_page_number
      get_all_categories
    end

    def create_ad
      @ad = {
        title: "Advmeds Design",
        description: "Best Clinic reservation system",
        action_title: "more"
      }
    end

    def get_current_page_number
      @current_page_number = params[:current_page] ? params[:current_page].to_i : 1
    end

    def get_all_categories
      @categories = Category.all
    end

    def get_products
      @products = Product.all
    end

    def create_pagination
      @first_page_number = 1
      @last_page_number = @products.count / PRODUCTS_PER_PAGE_COUNT
      if (Product.count % PRODUCTS_PER_PAGE_COUNT)
        @last_page_number += 1
      end

      @products = @products.offset((@current_page_number - 1) * PRODUCTS_PER_PAGE_COUNT).limit(PRODUCTS_PER_PAGE_COUNT)
    end
end
