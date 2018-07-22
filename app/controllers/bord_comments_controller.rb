class BordCommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @bord = TroubleBord.find(params[:trouble_bord_id])
    @comment = @bord.bord_comments.new(bord_comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to trouble_bord_path(@comment.trouble_bord_id), notice: '投稿できませんでした' }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js {
        @id_comment = @comment.id
        render :form
      }
    end
  end

  def update
    respond_to do |format|
      if @comment.update(bord_comment_params)
        format.js { render :index}
      else
        format.html { redirect_to trouble_bords_path(@comment.trouble_bord_id), notice: '編集できませんでした' }
      end
    end
  end

  def destroy
    @comment.delete
    respond_to do |format|
      format.js { render :index, notice:'削除しました' }
    end
  end

  private
    def bord_comment_params
      params.require(:bord_comment).permit(:trouble_bord_id, :content)
    end

    def set_comment
      @comment = BordComment.find(params[:id])
    end
end
