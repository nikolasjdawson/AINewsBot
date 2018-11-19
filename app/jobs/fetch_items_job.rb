class FetchItemsJob
  include SuckerPunch::Job
  require 'open-uri'

  def perform
    ActiveRecord::Base.connection_pool.with_connection do
      feed_sources = FeedSource.all
      feed_sources.each do |fs|
        doc = Nokogiri::XML(open(fs.link))
        items = doc.css("item link").first(fs.num_articles)
        items.each do |d|
          unless Item.where(link: d.text).any?
            Item.create(link: d.text, feed_source_id: fs.id)
          end
        end
      end
    end
  end
end
