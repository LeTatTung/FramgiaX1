class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?
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

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up){|u| u.permit :email,
      :name, :password, :password_confirmation, :sex, :avatar}
  end

  private
  def layout_by_resource
    if devise_controller?
      "application"
    end
  end
end
