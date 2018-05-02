class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def product_name
    product.try(:name) #有可能沒有product, nil.東西就會回nil
  end

  def product_price
    @price = product.try(:price)

    if !@price || @price < 0
      @price = 0
    end

    @price
  end
end
