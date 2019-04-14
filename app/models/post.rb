class Post < ApplicationRecord
  belongs_to :post_category
  extend FriendlyId
  friendly_id :title, use: :slugged
  mount_uploader :image, PostImageUploader
  acts_as_taggable
end
