class TagsController < ApplicationController


  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new
    @tag.name = params[:name]
    if @tag.save
      flash[:success] = "Tag created!"
      redirect_to tags_path
    else
      puts @tag.errors.full_messages
      flash[:danger] = @tag.errors.full_messages
      redirect_to tags_path
    end
  end

  def destroy
    Tag.find(params[:id]).destroy
    flash[:success] = "Tag deleted"
    redirect_to tags_path
  end

  def destroy
    Tag.find(params[:id]).destroy
    flash[:success] = "Tag deleted"
    redirect_to tags_path
  end

  def index
    @tags = Tag.paginate(page: params[:page])
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    if @tag.update(tag_params)
      flash[:success] = "Ad updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end


  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end

