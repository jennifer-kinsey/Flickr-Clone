class PicturesController < ApplicationController

  def index
    @pictures = Picture.order('created_at')
    @id = current_user.id
  end

  def show
    @users = User.all
    @user = current_user
    @picture = Picture.find(params[:id])
    @association = Association.new
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @user = User.find(current_user.id)
    if @picture.save
      this_user_id = current_user.id
      this_picture_id = @picture.id
      @association = Association.new(:user_id => this_user_id, :picture_id => this_picture_id)
      @association.save
      flash[:notice] = "Picture successfully added!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Picture save failed!"
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      flash[:notice] = "Picture successfully edited!"
      redirect_to pictures_path
    else
      flash[:alert] = "Picture edit failed!"
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "Picture successfully deleted!"
    redirect_to pictures_path
  end

private
  def picture_params
    params.require(:picture).permit(:image)
  end


end
