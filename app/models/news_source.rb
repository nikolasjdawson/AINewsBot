class NewsSource < ApplicationRecord
  has_many :likes
  validates :title, :link, presence: true

  def liked_by_liker?(liker)
    self.likes.where(liker: liker).any?
  end
end
