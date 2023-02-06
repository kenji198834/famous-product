class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]
  
  def index
    @posts = Post.all.order('created_at DESC')
    @prefecture = Prefecture.find(params[:prefecture_id])
    @posts = @prefecture.posts.includes(:post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :message, :image, prefecture_ids: []).merge(user_id: current_user.id)
  end

  def move_to_index
    @post = Post.find(params[:id])
    unless current_user.id == @post.user.id
      redirect_to action: :index
    end
  end

end