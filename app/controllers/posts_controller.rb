class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comments = @post.comments
  end

  def new
    @post = current_user.posts.build   
    @subshreddit = Subshreddit.find(params[:subshreddit_id])
  end

  def edit
    @subshreddit = Subshreddit.find(params[:subshreddit_id])
  end

  def create
    @subshreddit = Subshreddit.find(params[:post][:subshreddit_id])
    @post = current_user.posts.build(post_params)

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

    def post_params
      params.require(:post).permit(:title, :body, :subshreddit_id)
    end

end