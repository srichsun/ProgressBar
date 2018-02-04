class SubcategoriesController < ApplicationController
  before_action :get_category, only: [:products]
  before_action :get_subcategory, only: [:products]

  def products
  end

  private

  def get_category
    @category = Category.find_by_id(params.permit([:category_id])[:category_id])
  end

  def get_subcategory
    @subcategory = Subcategory.find_by_id(params.permit([:subcategory_id])[:subcategory_id])

    # 分類1   3c  category_id: 1
    # 副分類1 手機 subcategory_id: 1
    # 副分類2 電視 subcategory_id: 2
    # 副分類3 冰箱 subcategory_id: 3

    # 分類2   美食 category_id: 2
    # 副分類4 火鍋 subcategory_id: 4
    # 副分類5 素食 subcategory_id: 5
    # 副分類6 拉麵 subcategory_id: 6

    # 如果網址出現主分類是1，副分類卻是2的情況，不合理，要做處理
    # http://localhost:3000/categories/2/subcategories/1/products
    # 我們導到主分類的商品
    if (@subcategory.category != @category)
      redirect_to products_category_path(@category)
    end
  end
end
