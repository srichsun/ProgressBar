class CartItemsController < ApplicationController
  before_action :redirect_to_root_if_not_logged_in
  before_action :get_cart, except: [:index]
  before_action :get_cart_item, only: [:update, :destroy]

  def index
    @buy_now_items = current_user.buy_now_cart.cart_items
    @buy_next_time_items = current_user.buy_next_time_cart.cart_items

    @amount = current_user.buy_now_cart.amount
  end

  def create
    product = Product.find_by_id(params[:product_id])
    if !product
      flash[:notice] = '沒有這個商品'
      redirect_to root_path
      return
    end

    CartItem.create(product: product, cart: @cart, quantity: 1)
    flash[:notice] = "加入商品成功"

    if @cart.buy_now? # enum用法
      flash[:notice] = "加入購物車成功"
    elsif @cart.buy_next_time?
      flash[:notice] = "加入下次購買成功"
    end

    redirect_to product_path(product)
  end

  def update
    #code
  end

  def destroy
    @cart_item.destroy

    redirect_to :index
  end

  private
    def get_cart
      @cart = current_user.carts.find_by(cart_type: params[:cart_type])
      # 可以先寫死，然後去rails c 去測以下code是否正確，再改為吃傳進來的參數
      # current_user = User.last
      # @cart = current_user.carts.find_by(cart_tpe: :buy_now)

      if !@cart
        flash[:notice] = "沒有找到目標購物車"
        redirect_to :index
        return
      end
    end

    def get_cart_item
      @cart_item = @cart.cart_items.find_by_id(params[:id])

      if !@cart_item
        flash[:notice] = "沒有找到目標購物車商品"
        redirect_to :index
        return
      end
    end
end
