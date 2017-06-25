class RelationshipsController < ApplicationController
  before_action :load_user

  def create
    @relationship = current_user.follow @user
  end

  def destroy
    current_user.unfollow @user
    @relationship = current_user.active_relationships.build
  end

  private
  def load_user
    @user = User.find_by id: params[:user_id]
    unless @user
      flash[:danger] = t "error.user_not_found"
      redirect_to root_path
    end
  end
end
