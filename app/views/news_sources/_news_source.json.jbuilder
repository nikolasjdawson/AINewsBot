json.extract! news_source, :id, :likes, :link, :title, :created_at, :updated_at
json.url news_source_url(news_source, format: :json)
