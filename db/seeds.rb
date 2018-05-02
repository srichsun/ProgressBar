# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user
# admin = User.create(
#   name: "rock",
#   email: "a@gmail.com",
#   password: "333",
#   is_admin: "true"
# )

# category, subcategory
categories = [
  {
    name: "3c",
    subcategories: [
      { name: "phone" },
      { name: "computer" },
      { name: "television" }
    ]
  },
  {
    name: "food",
    subcategories: [
      { name: "bread" },
      { name: "all you can eat" },
      { name: "hot pot"}
    ]
  }
]

categories.each do |c|
  category = Category.create(name: c[:name])
  c[:subcategories].each do |subc|
      subcategory = category.subcategories.create(name: subc[:name])
      # subcategory =Subcategory.create(name: subc[:name], category: category)
      # 另外一種產生方法
  end
end

# product
Subcategory.all.each_with_index do |subcategory, index|
  products_count = (index + 1)*2

  products_count.times do
    product =
    {
      name: "ocean",
      description: "beautiful ocean",
      # image_url: "https://static.pexels.com/photos/128458/pexels-photo-128458.jpeg",
      subcategory: subcategory
    }

    Product.create(product)
  end
end
