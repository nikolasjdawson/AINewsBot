json.extract! item, :id, :title, :link, :pub_date, :description, :category, :feed_source_id, :created_at, :updated_at
json.url item_url(item, format: :json)
