class Image < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy
  has_many :feed_backs, class_name: FeedBack.name, foreign_key: :image_id,
    dependent: :destroy

  validates :user, presence: true
  validates :category, presence: true

  mount_uploader :image, ImageUploader

  scope :popular_images, -> {order(like_number: :desc).limit Settings.limit_popular_images}

  def main_comments
  	comments.where(parent_id: nil).order id: :desc
  end

  def likes
    feed_backs.like
  end

  def main_shares
    Image.where share_id: self.id
  end

  def shared_image
    Image.find_by id: self.share_id
  end

  def sharer
    User.find_by id: self.sharer_id
  end

  def destroy_images
    ActiveRecord::Base.transaction do
      Image.destroy self.main_shares.ids
      self.destroy
    end
    return true
    rescue => e
    return false
  end
end
