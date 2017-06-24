class Image < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy

  validates :user, presence: true
  validates :category, presence: true

  mount_uploader :image, ImageUploader

  scope :popular_images, -> {order(like_number: :desc).limit Settings.limit_popular_images}

  def main_comments
  	comments.where parent_id: nil
  end
end
