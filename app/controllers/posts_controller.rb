class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(6)
  end

 def new
    @post = Post.new
    @parents = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @parents << parent.name
    end
  end

  def dynamic_select_category
    @category = Category.find(params[:category_id])
   end

   def get_children
    respond_to do |format|
      format.html
      format.json do
       @children = Category.find(params[:parent_id]).children
       #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end
  
  def create
    Post.create(post_params)
  end 

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user) 
  end

  private
  def post_params
    params.require(:post).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  before_action :set_categories, only: %w[edit new]
private
def set_categories
 @parent_categories = Category.roots
 @default_child_categories = @parent_categories.first.children
end

end
