class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def load_data_static
    if user_signed_in?
      size = Settings.load_more_user_size
      @followings = current_user.just_followed
        .limit size
      @know_users = current_user.know_users.limit size
      @popular_images = Image.popular_images
        .limit Settings.load_more_image_size
    end
  end
end
