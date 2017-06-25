class BookMarksController < ApplicationController
  before_action :load_user, :load_data_static, only: :index
  before_action :load_image, only: [:create, :destroy]
  before_action :load_book_mark, only: :destroy

  def index
    @images = @user.book_marked_images
    unless @images.empty?
      image_offset = params[:image_offset] ||
        (@images.first.id + 1)
      image_size = Settings.load_more_image_size
      @images = @images.where("id < ?", image_offset)
        .limit image_size
      @last = @images.size < image_size ? true : false
    end
  end

  def create
    @book_mark = @image.feed_backs.new
    @book_mark.user = current_user
    @book_mark.feed_back_type = "book_mark"
    @book_mark.save
  end

  def destroy
    @book_mark.destroy
  end

  private
  def load_user
    @user = User.find_by id: params[:user_id]
    unless @user
      flash[:danger] = t "error.user_not_found"
      redirect_to root_path
    end
  end

  def load_image
    @image = Image.find_by id: params[:image_id]
    unless @image
      flash[:danger] = t "error.image_not_found"
      redirect_to root_path
    end
  end

  def load_book_mark
    @book_mark = current_user.book_marks.find_by id: params[:id]
    unless @book_mark
      flash[:danger] = t "error.not_found"
      redirect_to root_path
    end
  end
end
