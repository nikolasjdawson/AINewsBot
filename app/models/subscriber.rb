class Subscriber < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
end
