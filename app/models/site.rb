class Site < ApplicationRecord
  validates :name, :host, :admin_email, :logo, :favicon_link, :mailgun_key, :mailgun_domain, :intro, presence: true
end
