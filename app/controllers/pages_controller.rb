class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :load_data

  def index
  end

  def show
    render template: "pages/#{params[:page]}"
  end

  private
  def load_data
    @images = Image.all
  end
end
