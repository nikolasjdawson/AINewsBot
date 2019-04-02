# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
# unless Category.all.any?
#   categories = [
#     {title: "News", position: 1},
#     {title: "Blogs", position: 2},
#     {title: "Research", position: 3},
#     {title: "Reddit", position: 4},
#     {title: "Twitter", position: 5}
#   ]
#   categories.each do |cat|
#     Category.create(title: cat[:title], position: cat[:position])
#   end
# end
# unless DayOfWeek.all.any?
#   days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
#   days.each do |d|
#     DayOfWeek.create(name: d)
#   end
# end
Post.destroy_all
doc = Nokogiri::XML(open('posts.xml'))
num_items = doc.css('item').count
i = 0
while i < num_items
  item = doc.css('item')[i]
  # puts item.css('content:encoded').text
  post = Post.create(title: item.css('title').text, pub_date: item.css('pubDate').text, body: item.xpath('content:encoded').text, is_published: true, slug: item.css('link').text.split('https://bitsandatoms.co/')[1].chomp('/'))
  i += 1
end
