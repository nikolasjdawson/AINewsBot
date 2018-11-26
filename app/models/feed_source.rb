class FeedSource < ApplicationRecord
  has_many :items
  belongs_to :category
end
