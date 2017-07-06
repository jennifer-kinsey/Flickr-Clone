class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @tag = Tag.new(tag_params)
    # @tag = @picture.tags.build(tag_params)
    @tag.picture_id = @picture.id

    if @tag.save
      flash[:notice] = "Tag successfully added!"
      redirect_to picture_path(@picture)
    else
      flash[:alert] = "Tag save failed!"
      redirect_to picture_path(@picture)
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "Tag successfully edited!"
      redirect_to tags_path
    else
      flash[:alert] = "Tag edit failed!"
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "Tag successfully deleted!"
    redirect_to tags_path
  end

private
  def tag_params
    params.require(:tag).permit(:name, :picture_id)
  end


end
