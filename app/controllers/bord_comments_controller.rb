class BordCommentsController < ApplicationController
  def create
    @comment = BordComment.new(params[:BordComment].permit[:trouble_bord_id,:comment])
    @comment.user_id = current_user.id
    @comment.save
    redirect_to trouble_bord_path(paramas[:BordComment][:trouble_bord_id])
  end
end
