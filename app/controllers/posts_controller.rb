class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :force_top
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to user_path(current_user.id), notice: "日記を作成しました"
    else
      render 'new'
    end
  end

  def show
    @favorite_post = current_user.favorite_posts.find_by(post_id: @post.id)
  end

  def index
    current_user_id = params[:id]
    if current_user_id.nil?
      @posts = Post.all
    else
      @posts = Post.where(id: current_user_id)
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to user_path(current_user.id), notice: "日記を編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user.id), notice:"ブログを削除しました！"
  end
  private
  def post_params
    params.require(:post).permit(:title, :content, :image,:image_cache)
  end
  def set_post
    @post = Post.find(params[:id])
  end

end
