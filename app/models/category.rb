class Category < ApplicationRecord
  validates :name, presence: true

  has_many :images, dependent: :destroy

  class << self
  	def search data
  	  data = data.downcase
  	  Category.where "lower(name) LIKE ?", "%#{data}%"
  	end
  end
end
