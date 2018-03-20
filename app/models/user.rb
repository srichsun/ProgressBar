class User < ApplicationRecord
  has_many :carts

  after_save :add_carts

  def add_carts
    if self.carts.blank?
      Cart.buy_now.create(user: self)
      Cart.buy_next_time.create(user: self)
    end
  end
end
