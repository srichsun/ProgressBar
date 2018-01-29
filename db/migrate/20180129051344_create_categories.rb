class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories, id: false do |t|
      t.primary_key :kkk
      t.string :name
      t.text :description
      t.string :image_url
      t.timestamps
    end
  end
end
