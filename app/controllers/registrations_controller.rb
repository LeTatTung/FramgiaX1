class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end

  def create
    super
    Profile.create! user: @user
  end
end
