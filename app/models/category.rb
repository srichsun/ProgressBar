class Category < ApplicationRecord
  has_many :subcategories
  # 這樣Category的物件就會有.subcategories等等方法可以用

  # 如果寫
  # has_many :children, class_name: 'Subcategory', foreign_key: 'category_id'
  # 這樣當Category物件.children其實就是.subcategories

  has_many :products, through: :subcategories
end
