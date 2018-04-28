class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :load_subshreddit, only: [:show, :new, :edit, :create]

  def index
    @posts = Post.all
  end

  def show
    @comments = @post.comments
  end

  def new
    @subshreddits = Subshreddit.all
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = @subshreddit.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def load_subshreddit
    	@subshreddit = Subshreddit.where(id: params[:subshreddit_id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end

end