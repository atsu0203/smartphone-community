class CategoriesController < ApplicationController
  before_action :set_parents, only:[:index, :show, :new, :edit]
  def set_parents
    @parents = Category.where(ancestry: nil)
  end

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
