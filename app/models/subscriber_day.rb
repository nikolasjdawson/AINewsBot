class SubscriberDay < ApplicationRecord
  belongs_to :subscriber
  belongs_to :day_of_week
end
