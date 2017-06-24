class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :load_data_static, :load_data

  def show
  end

  private
  def load_data
    if user_signed_in?
      @categories = Category.all
      @images = current_user.images_news_feed.offset(0)
        .limit Settings.load_more_image_size
    end
  end
end
