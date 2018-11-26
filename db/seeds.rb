# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = [
  {title: "News", position: 1},
  {title: "Blogs", position: 2},
  {title: "Research", position: 3},
  {title: "Reddit", position: 4},
  {title: "Twitter", position: 5}
]
categories.each do |cat|
  Category.create(title: cat[:title], position: cat[:position])
end
