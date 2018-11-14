json.extract! feed_source, :id, :title, :link, :feed_type, :num_articles, :description, :created_at, :updated_at
json.url feed_source_url(feed_source, format: :json)
