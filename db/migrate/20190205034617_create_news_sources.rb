class CreateNewsSources < ActiveRecord::Migration[5.2]
  def change
    create_table :news_sources do |t|
      t.integer :likes
      t.string :link
      t.string :title

      t.timestamps
    end
  end
end
