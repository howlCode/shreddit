class SubshredditsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_subshreddit, only: [:show, :edit, :update, :destroy]

  def index
    @subshreddits = Subshreddit.all
  end

  def show
    @posts = @subshreddit.posts
  end

  def new
    @subshreddit = current_user.subshreddits.build if user_signed_in?
  end

  def edit
  end

  def create
    @subshreddit = current_user.subshreddits.build(subshreddit_params)

    if @subshreddit.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @subshreddit.update(subshreddit_params)
      render @subshreddit
    else
      render 'edit'
    end
  end

  def destroy
    @subshreddit.destroy
  end

  private
    def set_subshreddit
      @subshreddit = Subshreddit.find(params[:id])
    end

    def subshreddit_params
      params.require(:subshreddit).permit(:name)
    end

end