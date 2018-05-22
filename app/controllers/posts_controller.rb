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
      redirect_to post_path(@post.id), notice: "日記を作成しました"
      unless @post.user.followers.blank?
        NoticeMailer.notice_mail(@post).deliver
      end
    else
      render 'new'
    end
  end

  def show
    @favorite_post = current_user.favorite_posts.find_by(post_id: @post.id)
    @comment = @post.comments.build
    @comments = @post.comments
  end

  def index
    @search = Post.search(params[:q])
    @search_posts = @search.result.includes(:user).page(params[:page])

    current_user_id = params[:id]

    if current_user_id.nil?
      if @search_posts.nil?
        @posts = Post.page(params[:page])
      else
        @posts = @search_posts
      end
    else
      @posts = Post.where(user_id: current_user_id).page(params[:page])
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "日記を編集しました"
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
