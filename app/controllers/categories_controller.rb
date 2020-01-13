class CategoriesController < ApplicationController

  # def new
  #   @children = Category.find(params[:parent_id]).children
  #   respond_to do |format|
  #     format.html
  #     format.json
  #   end
  # end

  def show
    @children = Category.find(params[:id]).child_ids
    @posts = Post.where(category_id: @children).order("created_at DESC").page(params[:page]).per(6)
  end
end
