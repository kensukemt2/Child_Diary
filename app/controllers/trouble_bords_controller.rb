class TroubleBordsController < ApplicationController
  berore_action :force_top
  def index
    @bords = TroubleBord.all
    @newbord = TroubleBord.new
  end

  def create
    @newbord = TroubleBord.new(params[:TroubleBord].permit[:title, :content])
    @newbord.user_id = current_user.id
    @newbord.save
    redirect_to trouble_bords_path
  end

  def show
    @bord = TroubleBord.find(params[:id])
    @newcomment = BordComment.new(:trouble_bord_id)
    @comments = BordComment.where(trouble_bord_id: params[:id])
  end

  def destroy
    @bord.delete
    redirect_to trouble_bords_path
  end

end
