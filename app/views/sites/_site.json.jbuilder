json.extract! site, :id, :name, :host, :admin_email, :logo, :favicon_link, :mailgun_key, :mailgun_domain, :intro, :created_at, :updated_at
json.url site_url(site, format: :json)
