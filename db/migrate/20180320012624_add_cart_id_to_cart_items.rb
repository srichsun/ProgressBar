class AddCartIdToCartItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :cart_items, :cart, foreign_key: true
  end
end
