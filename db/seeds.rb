# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PRODUCTS_COUNT = 80

PRODUCTS_COUNT.times do
  product =
  {
    name: "ocean",
    description: "beautiful ocean",
    image_url: "https://static.pexels.com/photos/128458/pexels-photo-128458.jpeg"
  }

  Product.create(product)
end
