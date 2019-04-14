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
require 'open-uri'
url = 'https://bitsandatoms.co/blog/page/'
i = 0
while i < 4
  doc = Nokogiri::HTML(open(url + (i + 1).to_s))
  num_posts = doc.css('.post-title a').count
  p = 0
  while p < num_posts
    post_url = doc.css('.post-title a')[p]['href']
    post = Nokogiri::HTML(open(post_url))
    post_content = post.css('.entry-content').text
    pub_date = post.css('.year').text
    title = post.css('.entry-title').text
    post = Post.create(title: title, pub_date: pub_date, body: post_content, is_published: true, slug: post_url.split('https://bitsandatoms.co/')[1].chomp('/'))
    p += 1
  end
  i += 1
end
