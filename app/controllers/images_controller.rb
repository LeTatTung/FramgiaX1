class ImagesController < ApplicationController
  before_action :load_data_static, only: :show
  before_action :load_image, except: [:index, :new, :create]

  def index
    @images = if params[:address]
      Image.search(params[:address]).order(id: :desc) if params[:address]
    elsif params[:category]
      category =  Category.find_by id: params[:category]
      category.images.order(id: :desc) if category
    else
      current_user.images_news_feed
    end
    unless @images.empty?
      image_offset = params[:image_offset] || (@images.first.id + 1)
      @images = @images.where("id < ?", image_offset)
        .limit Settings.load_more_image_size
      @last = (@images.size < Settings.load_more_image_size) ? true : false
    end

    respond_to do |format|
      format.html {load_data_static}
      format.js
    end
  end

  def show
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

  def edit
    @categories = Category.all
  end

  def update
    if @image.update_attributes image_params
      flash[:success] = t "image_action.update.success"
      redirect_to @image
    end
  end

  def destroy
    if current_user == @image.user && @image.destroy_images
      flash[:success] = t "image_action.delete.success"
    else
      flash[:danger] = t "image_action.delete.fail"
    end
    redirect_to root_path
  end

  private
  def image_params
    params.require(:image).permit :description, :image, :address, :category_id
  end

  def load_image
    @image = Image.find_by id: params[:id]
    unless @image
      flash[:danger] = t "error.image_not_found"
      redirect_to root_path
    end
  end
end
