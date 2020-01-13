class CategoriesController < ApplicationController
  def new
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

  def index
    @category
    @children = Category.find(params[:parent_id]).children
    @category = Category.find(params[:category_id])
    # category_idと紐づく投稿を取得
    @posts = @category.posts.order("created_at DESC").page(params[:page]).per(6)
  end

  def show

    @category
    @children = Category.find(params[:parent_id]).children
    @category = Category.find(params[:category_id])
    # category_idと紐づく投稿を取得
    @posts = @category.posts.order("created_at DESC").page(params[:page]).per(6)

    binding.pry
    @children = Category.find(params[:parent_id]).children
    @posts = Post.includes(:category params(@children)).order("created_at DESC").page(params[:page]).per(6)
    
  end
end
