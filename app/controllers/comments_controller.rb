class CommentsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :load_post, only: [:index, :show, :new, :edit, :create]
  before_action :load_subshreddit, only: [:show, :new, :edit, :create]

  def index
    @comments = @post.comments.all
  end

  def show
  end

  def new 
    @comment = current_user.posts.comments.build
  end

  def edit
  end

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to comments_path
    else
      render 'new'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to comments_path
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy

    redirect_to posts_path
  end

  private
    def set_comment
      @comment = Post.comments.find(params[:id])
    end

    def load_post
    	@post = Post.where(id: params[:post_id])
    end

    def load_subshreddit
      @subshreddit = Post.subshreddit.where(id: params[:subshreddit_id])
    end

    def comments_params
      params.require(:comment).permit(:body)
    end

end