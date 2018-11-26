class Category < ApplicationRecord
  has_many :feed_sources
  has_many :items, through: :feed_sources
  def latest_items
    self.items.where(created_at: 1.day.ago..DateTime.now)
  end
end
