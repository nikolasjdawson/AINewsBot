class AddCategoryToFeedSource < ActiveRecord::Migration[5.2]
  def change
    add_reference :feed_sources, :category, foreign_key: true
  end
end
