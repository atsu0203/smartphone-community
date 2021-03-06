class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :get_category_parent, only: [:new, :edit, :create, :update]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(6)
  end

  def new
    @post = Post.new
  end

  def create
    if params[:post][:category] == "---" || params[:category] == "---"
      flash[:danger] = 'シリーズと機種を入力してください'
      redirect_to new_post_path
    else
      @category = Category.find_by(name: params[:category])
      @post = Post.new(post_params)
        if @post.save
        else
        render :new
      end
    end
  end 

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params_update)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user) 
    @like = Like.new
  end


  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end



  private
  def post_params
    params.require(:post).permit(:name, :image, :text, :tag_ids).merge(user_id: current_user.id ,category_id: @category.id )
  end

  def post_params_update
    params.require(:post).permit(:name, :image, :text, :tag_ids).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def get_category_parent
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

end

