class ReportsController < ApplicationController
  before_action :load_image, only: :create

  def create
    @flash = ActionDispatch::Flash::FlashHash.new
    unless current_user.reported @image
      @report = @image.feed_backs.new
      @report.user = current_user
      @report.feed_back_type = "report"
      @report.save
    end
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
