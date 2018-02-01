class Subcategory < ApplicationRecord
  belongs_to :category
  # 以上就等於以下，後面可以省略不寫
  # belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
  has_many :products

  def name_with_category
    "#{category.try(:name)}" + " / "+ "#{name}"
    #等同於Subcategory物件.category, Subcategory物件.name
  end
end
