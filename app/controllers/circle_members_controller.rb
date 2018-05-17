class CircleMembersController < ApplicationController
  def create
    circlemember = current_user.circle_members.create(circle_id: params[:circle_id])
    redirect_to user_path(current_user.id), notice: "サークルに参加しました"
  end
  def destroy
    circlemember = current_user.circle_members.find_by(circle_id: params[:circle_id]).destroy
    redirect_to user_path(current_user.id), notice: "サークルをやめました"
  end
end
