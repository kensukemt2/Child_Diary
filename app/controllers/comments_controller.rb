class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index}
      else
        format.html { redirect_to post_path(@post), notice: '投稿できませんでした' }
      end
    end
  end
  def edit
    respond_to do |format|
      format.js {
        @id_comment = @comment.id
        render 'form'
      }
      format.html { render 'posts/show' }
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.js { render :index }
      else
        format.html { redirect_to post_path(@comment.post_id), notice: '編集できませんでした' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.delete
        format.js { render :index, notice: 'コメントを削除しました。' }
      else
        format.html { redirect_to post_path(@comment.post_id) }
      end
    end
  end
  private

  def comment_params
    params.require(:comment).permit(:post_id, :content, :user_id)
  end

  def set_post

  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
