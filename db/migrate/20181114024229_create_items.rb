class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :link
      t.datetime :pub_date
      t.text :description
      t.string :category
      t.belongs_to :feed_source, foreign_key: true

      t.timestamps
    end
  end
end
