class TroubleBordsController < ApplicationController
  before_action :force_top

  def index
    @bords = TroubleBord.all
    @newbord = TroubleBord.new
  end

  def create
    @newbord = current_user.trouble_bords.build(bord_params)
    @newbord.save
    redirect_to trouble_bords_path
  end

  def show
    @bord = TroubleBord.find(params[:id])
    @newcomment = BordComment.new(trouble_bord_id: @bord.id)
    @comments = BordComment.where(trouble_bord_id: params[:id])
  end

  def destroy
    @bord.destroy
    redirect_to trouble_bords_path
  end

  private

  def bord_params
    params.require(:trouble_bord).permit(:title, :content)
  end
end
