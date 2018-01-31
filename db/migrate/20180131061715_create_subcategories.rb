class CreateSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.belongs_to :category #加這行
      t.timestamps
    end
  end
end
