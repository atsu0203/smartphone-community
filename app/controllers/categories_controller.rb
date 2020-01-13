class CategoriesController < ApplicationController
  before_action :set_parents, only:[:index, :show, :new, :edit]
  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def new
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end


  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.order("created_at DESC").page(params[:page]).per(6)
    @parents
    # @children = Category.find(params[:parent_id]).children
    # @posts = @children.posts.order("created_at DESC").page(params[:page]).per(6)
    # @category = Category.find(params[:category_id])
    # category_idと紐づく投稿を取得
    
    # binding.pry
    # @posts = Post.includes(:category params(@children)).order("created_at DESC").page(params[:page]).per(6)
  end
end
