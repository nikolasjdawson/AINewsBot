class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.belongs_to :news_source, foreign_key: true
      t.string :liker

      t.timestamps
    end
    add_index :likes, :liker, unique: true
  end
end
