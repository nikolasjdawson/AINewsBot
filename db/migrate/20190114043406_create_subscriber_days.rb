class CreateSubscriberDays < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriber_days do |t|
      t.belongs_to :subscriber, foreign_key: true
      t.belongs_to :day_of_week, foreign_key: true

      t.timestamps
    end
  end
end
