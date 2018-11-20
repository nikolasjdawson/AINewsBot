class FetchItemsJob
  include SuckerPunch::Job
  require 'open-uri'

  def perform
    ActiveRecord::Base.connection_pool.with_connection do
      feed_sources = FeedSource.all
      feed_sources.each do |fs|
        doc = Nokogiri::XML(open(fs.link))
        i = 0
        while i < fs.num_articles
          link = doc.css("item link")[i].text
          unless Item.where(link: link).any?
            title = doc.css("item title")[i].text
            # description = doc.css("item description")[i].text
            category = doc.css("item category")[i].text
            pub_date = doc.css("item pubDate")[i].text
            host = URI.parse(link).host
            Item.create(feed_source_id: fs.id, link: link, title: title, category: category, pub_date: pub_date, host: host)
          end
          i += 1
        end
      end
    end
  end
end
