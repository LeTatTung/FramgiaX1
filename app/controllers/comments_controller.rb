class CommentsController < ApplicationController
  before_action :load_image, only: :index

  def index
    @comments = @image.main_comments
    comment_size = Settings.load_more_comment_size
    unless @comments.empty?
      comment_offset = params[:comment_offset] || (@comments.first.id + 1)
      @comments = @comments.where("id < ?", comment_offset)
        .limit comment_size
    end
    @last = @comments.size < comment_size ? true : false
  end

  private
  def load_image
    @image = Image.find_by id: params[:image_id]
    unless @image
      flash[:danger] = t "error.image_not_found"
      redirect_to root_path
    end
  end
end
