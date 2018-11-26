rails g scaffold Category title position:integer
rails g migration AddCategoryToFeedSource category:belongs_to
Create seeds file
Add form field and strong parameters in controller
For each category, find the items from the last 24 hours
Category.includes(:items).where(items: { created_at: 1.day.ago..DateTime.now })



Truncate descriptions

Devise
Simple_form

Reddit & Research cause errors

Push to Heroku
Rake tasks


cats = {
  [title: "News", position: 1]
}
