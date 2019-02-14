class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :host
      t.string :admin_email
      t.string :logo
      t.string :favicon_link
      t.string :mailgun_key
      t.string :mailgun_domain
      t.text :intro

      t.timestamps
    end
  end
end
