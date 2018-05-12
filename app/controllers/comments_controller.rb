class CommentsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_comment, only: [:destroy]
  before_action :load_post, only: [:new, :create]

  def new
    @comment = current_user.comments.build(post_id: params[:post_id])
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to @post
    else
      render 'new'
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
    	@post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end

end