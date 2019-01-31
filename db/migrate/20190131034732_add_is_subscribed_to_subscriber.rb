class AddIsSubscribedToSubscriber < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :is_subscribed, :boolean, default: true
  end
end
