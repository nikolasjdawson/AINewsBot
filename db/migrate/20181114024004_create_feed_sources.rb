class CreateFeedSources < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_sources do |t|
      t.string :title
      t.string :link
      t.string :feed_type
      t.integer :num_articles
      t.string :description

      t.timestamps
    end
  end
end
