class PopularImagesController < ApplicationController
  before_action :load_data_static

  def index
    @image = Image.new
    @categories = Category.all
    @images = Image.popular_images
    unless @images.empty?
      image_like_offset = params[:image_like_offset] || (@images.first
        .like_number + 1)
      image_offset = params[:image_offset] || (@images.first.id + 1)
      image_size = Settings.load_more_image_size
      @images = @images.where("like_number <= ? AND id < ?", image_like_offset,
        image_offset).limit image_size
      @last = @images.size < Settings.load_more_image_size ? true : false
    end
  end
end
