class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :load_data

  def show
  end

  private
  def load_data
    if user_signed_in?
      @followings = current_user.just_followed
      @popular_images = Image.popular_images
    end
  end
end
