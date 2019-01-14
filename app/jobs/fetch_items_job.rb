class FetchItemsJob
  include SuckerPunch::Job
  require 'open-uri'

  def perform
    ActiveRecord::Base.connection_pool.with_connection do
      feed_sources = FeedSource.all
      feed_sources.each do |fs|
        doc = Nokogiri::XML(open(fs.link, "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"))
        if doc.css("item").empty?
          item = "entry"
        else
          item = "item"
        end
        i = 0
        while i < fs.num_articles
          if doc.css(item + " link")[i]
            link = doc.css(item + " link")[i].text
            if link == ""
              link = doc.css('entry link')[i]['href']
            end
          else
            link = doc.css('entry link')[i]['href']
          end
          unless Item.where(link: link).any?
            title = doc.css(item + " title")[i].text
            # description = doc.css(item + " description")[i].text
            category = doc.css(item + " category")[i]
            unless category.nil?
              category = category.text
            else
              category = ""
            end
            pub_date = doc.css(item + " pubDate")[i]
            unless pub_date.nil?
              pub_date = pub_date.text
            else
              pub_date = DateTime.now
            end
            host = URI.parse(link).host
            Item.create(feed_source_id: fs.id, link: link, title: title, category: category, pub_date: pub_date, host: host)
          end
          i += 1
        end
      end
    end
  end
end
