class BordCommentsController < ApplicationController
  def create
    @comment = BordComment.new(comment: params[:bord_comment][:comment])
    @comment.trouble_bord_id = params[:trouble_bord_id]
    @comment.user_id = current_user.id
    @comment.save
    redirect_to trouble_bords_path(@comment.trouble_bord_id)
  end
  private
    def bord_comment_params
      params.require(:bord_comment).permit(:trouble_bord_id, :conment)
    end
end
