class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image

  validates :user, presence: true
  validates :image, presence: true
  validates :content, presence: true

  def reply_comments
    user_id = self.id
    Comment.where(parent_id: user_id).where.not id: user_id
  end

  def reply_comment
    Comment.find_by id: self.reply_id
  end
end
