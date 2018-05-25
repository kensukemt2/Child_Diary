class TroubleBordsController < ApplicationController
  before_action :force_top
  def index
    @bords = TroubleBord.all
    @newbord = TroubleBord.new
  end

  def create
    @newbord = TroubleBord.new(bord_params)
    @newbord.user_id = current_user.id
    @newbord.save
    redirect_to trouble_bords_path
  end

  def show
    @bord = TroubleBord.find(params[:id])
    @newcomment = BordComment.new(trouble_bord_id: @bord.id)
    @comments = BordComment.where(trouble_bord_id: params[:id])
  end

  def destroy
    @bord.delete
    redirect_to trouble_bords_path
  end

  private

  def bord_params
    params.require(:trouble_bord).permit(:title, :content)
  end
end
