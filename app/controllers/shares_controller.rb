class SharesController < ApplicationController
  before_action :load_image
  before_action :load_share_image, only: [:edit, :update]

  def new
    @share_image = Image.new
  end

  def create
    @share_image = @image.dup
    @share_image.like_number = 0
    @share_image.comment_number = 0
    @share_image.sharer_id = current_user.id
    @share_image.share_id = @image.id
    @share_image.share_description = share_image_params[:share_description]
    if @share_image.update_attributes image: @image.image
      flash[:success] = t "image_action.share.success"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @share_image.update_attributes share_image_params
      flash[:success] = t "image_action.share.success"
      redirect_to root_path
    end
  end

  private
  def share_image_params
    params.require(:image).permit :share_description
  end

  def load_image
    @image = Image.find_by id: params[:image_id]
    unless @image
      flash[:danger] = t "error.image_not_found"
      redirect_to root_path
    end
  end

  def load_share_image
    @share_image = Image.find_by id: params[:id]
    unless @share_image
      flash[:danger] = t "error.image_not_found"
      redirect_to root_path
    end
  end
end
