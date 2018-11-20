class AddHostToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :host, :string
  end
end
