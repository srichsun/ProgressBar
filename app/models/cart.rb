class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  enum cart_type: [:buy_now, :buy_next_time]

  def amount
    # work around 就是不是正解，但可以解決目前問題
    @amount = 0
    cart_items.each do |item|
      @amount += item.quantity * ( item.product_price || 0 )
    end

    @amount
  end
end
