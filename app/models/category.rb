class Category < ApplicationRecord
  validates :name, presence: true

  has_many :images, dependent: :destroy
end
