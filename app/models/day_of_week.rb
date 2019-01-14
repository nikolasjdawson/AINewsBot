class DayOfWeek < ApplicationRecord
  has_many :subscriber_days
  has_many :subscribers, through: :subscriber_days
end
