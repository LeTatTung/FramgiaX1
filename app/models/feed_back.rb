class FeedBack < ApplicationRecord
  belongs_to :user
  belongs_to :image

  validates :user, presence: true
  validates :image, presence: true

  enum feed_back_type: [:like, :book_mark, :report]
end
