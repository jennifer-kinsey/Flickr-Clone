class PicturesController < ApplicationController

  def index
    @pictures = Picture.order('created_at')
    @id = current_user.id
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      flash[:notice] = "Picture successfully added!"
      redirect_to  pictures_path
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
