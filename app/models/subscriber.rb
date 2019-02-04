require 'valid_email'
class Subscriber < ApplicationRecord
  has_many :subscriber_days, dependent: :destroy
  has_many :day_of_weeks, through: :subscriber_days
  validates :first_name, :last_name, :email, presence: true
  validates :email, :email => {:mx => true, :message => I18n.t('validations.errors.models.user.invalid_email')}
  # validates :email, uniqueness: true

  def self.active
    where(is_subscribed: true)
  end
end
