require 'valid_email'
class Subscriber < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, :email => {:mx => true, :message => I18n.t('validations.errors.models.user.invalid_email')}
  validates :email, uniqueness: true
end
