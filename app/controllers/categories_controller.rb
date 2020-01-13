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

# includes(category: @children)

  def show
    @children = Category.find(params[:id]).child_ids
    @posts = Post.where(category_id: @children).order("created_at DESC").page(params[:page]).per(6)

    # @children = Category.find(params[:parent_id]).children
    # @posts = @children.posts.order("created_at DESC").page(params[:page]).per(6)
    # @category = Category.find(params[:category_id])
    # category_idと紐づく投稿を取得
    # @posts = Post.includes(:category params(@children)).order("created_at DESC").page(params[:page]).per(6)
  end
end
