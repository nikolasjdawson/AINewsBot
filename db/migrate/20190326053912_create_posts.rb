class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :intro
      t.text :body
      t.string :image
      t.date :pub_date
      t.string :slug
      t.boolean :is_published, default: false

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
