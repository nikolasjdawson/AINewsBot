class NewsSource < ApplicationRecord
  validates :title, :link, presence: true
end
