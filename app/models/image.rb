class Image < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :user, presence: true
  validates :category, presence: true

  scope :popular_images, -> {order(like_number: :desc).limit Settings.limit_popular_images}
end
