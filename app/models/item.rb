class Item < ApplicationRecord
  belongs_to :feed_source

  after_create :fetch_info

  def fetch_info
    item_info = MetaInspector.new(self.link)
    self.update(title: item_info.title, description: item_info.description)
  end
end
