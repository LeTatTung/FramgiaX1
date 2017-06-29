class SearchesController < ApplicationController
  
  def index
  	unless params[:search].blank?
  	  @images = Image.search(params[:search]) || Array.new
  	  @users = User.search(params[:search]) || Array.new
  	  @addresses = Image.search(params[:search]).distinct
  	    .pluck(:address) || Array.new
  	  @categories = Category.search(params[:search]) || Array.new
  	end
  	respond_to do |format|
  	  format.html {load_data_static}
  	  format.js do
  	  	render json: {images: @images, users: @users,
  	  	  addresses: @addresses, categories: @categories, status: 200}
  	  end
  	end
  end
end
