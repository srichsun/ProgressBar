class Subcategory < ApplicationRecord
  belongs_to :category
  # 以上就等於以下，後面可以省略不寫
  # belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
  has_many :products
end
