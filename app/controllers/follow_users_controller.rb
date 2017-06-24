class FollowUsersController < ApplicationController
  before_action :load_data_static

  def index
    @type = params[:type] || "following"
    @users = current_user.send(@type).order id: :desc
    more_user = Settings.length_more_user
    unless @users.empty?
      follow_users_offset = params[:follow_users_offset] || (@users.first
        .id + 1)
      @users = @users.where("users.id < ?", follow_users_offset)
        .limit more_user
      @last = @users.size < more_user ? true : false
    end
  end
end
