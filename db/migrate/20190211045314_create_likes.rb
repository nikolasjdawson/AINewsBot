class CreateLikes < ActiveRecord::Migration[5.2]
  drop_table :likes
  def change
    create_table :likes do |t|
      t.belongs_to :news_source, foreign_key: true
      t.string :liker

      t.timestamps
    end
    add_index :likes, [:news_source_id, :liker], unique: true
  end
end
