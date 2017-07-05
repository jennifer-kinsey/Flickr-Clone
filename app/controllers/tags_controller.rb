class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(:name => tag_params.name)
    @user = User.find(current_user.id)
    if @tag.save
      this_user_id = current_user.id
      this_tag_id = @tag.id
      @association = Association.new(:user_id => this_user_id, :tag_id => this_tag_id)
      @association.save
      flash[:notice] = "Tag successfully added!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Tag save failed!"
      render :new
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
    params.require(:tag).permit(:name)
  end


end
