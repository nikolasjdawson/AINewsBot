json.extract! post, :id, :title, :intro, :body, :image, :pub_date, :slug, :is_published, :created_at, :updated_at
json.url post_url(post, format: :json)
