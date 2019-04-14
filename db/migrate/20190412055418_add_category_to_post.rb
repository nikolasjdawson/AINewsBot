class AddCategoryToPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :post_category, foreign_key: true
  end
end
