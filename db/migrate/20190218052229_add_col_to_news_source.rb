class AddColToNewsSource < ActiveRecord::Migration[5.2]
  def change
    add_column :news_sources, :is_accepted, :boolean, default: false
  end
end
