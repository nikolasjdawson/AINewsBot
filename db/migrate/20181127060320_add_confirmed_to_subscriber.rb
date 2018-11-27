class AddConfirmedToSubscriber < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :is_confirmed, :boolean, default: false
  end
end
