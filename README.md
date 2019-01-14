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

git pull
git push heroku master
heroku run rake update_feed

And then refresh browser (ainewsbot.herokuapp.com)

NLP summary


<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Artificial intelligence is providing “judgement free zone” to Capital One customers - Yahoo Finance<br><br>Read more here: <a href="https://t.co/GUSlZ8Cx6R">https://t.co/GUSlZ8Cx6R</a><a href="https://twitter.com/hashtag/ArtificialIntelligence?src=hash&amp;ref_src=twsrc%5Etfw">#ArtificialIntelligence</a> <a href="https://twitter.com/hashtag/AI?src=hash&amp;ref_src=twsrc%5Etfw">#AI</a> <a href="https://twitter.com/hashtag/DataScience?src=hash&amp;ref_src=twsrc%5Etfw">#DataScience</a> <a href="https://twitter.com/hashtag/MachineLearning?src=hash&amp;ref_src=twsrc%5Etfw">#MachineLearning</a> <a href="https://twitter.com/hashtag/BigData?src=hash&amp;ref_src=twsrc%5Etfw">#BigData</a> <a href="https://twitter.com/hashtag/DeepLearning?src=hash&amp;ref_src=twsrc%5Etfw">#DeepLearning</a> <a href="https://twitter.com/hashtag/NLP?src=hash&amp;ref_src=twsrc%5Etfw">#NLP</a> <a href="https://twitter.com/hashtag/Robots?src=hash&amp;ref_src=twsrc%5Etfw">#Robots</a> <a href="https://twitter.com/hashtag/IoT?src=hash&amp;ref_src=twsrc%5Etfw">#IoT</a></p>&mdash; Iain Brown, PhD (@IainLJBrown) <a href="https://twitter.com/IainLJBrown/status/1084640888335282176?ref_src=twsrc%5Etfw">January 14, 2019</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
