class AddSubcategoryIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :subcategory_id, :integer

    # mysql 或 postsql這樣寫就會自動幫你建index
    #add_column :products, :subcategory_id, :integer, index: true
    #但sqlite3不會，要加下面這行
    add_index :products, :subcategory_id
  end
end
