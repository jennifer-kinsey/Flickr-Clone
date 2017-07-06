class UsersController < ApplicationController
  def index
    @users = User.all
    @pictures = Picture.all
  end

  def show
    @user = User.find(params[:id])
    @logged_user = current_user
  end

end
