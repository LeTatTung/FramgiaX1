class ImagesController < ApplicationController
  before_action :load_data_static, only: :show
  before_action :load_image, except: [:index, :new, :create]

  def index
    @images = current_user.images_news_feed
    unless @images.empty?
      image_size = Settings.load_more_image_size
      image_offset = params[:image_offset] || @images.first.id
      @images = @images.where("id < ?", image_offset)
        .limit image_size
      @last = @images.size < image_size ? true : false
    end
  end

  def new
    @image = Image.new
    @categories = Category.all
  end

  def create
    @image = Image.new image_params
    @image.user_id = current_user.id

    if @image.save
      flash[:success] = t "image_action.upload.success"
    else
      respond_to do |format|
        format.html do
          flash[:danger] = t "image_action.upload.fail"
        end
        format.js
      end
    end
    redirect_to root_path
  end

  private
  def image_params
    params.require(:image).permit :description, :image, :address, :category_id
  end
end
