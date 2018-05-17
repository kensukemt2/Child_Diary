class FavoriteUsersController < ApplicationController
  def create
    if logged_in?
      @user = User.find(params[:favorite_user][:followed_id])
      current_user.follow!(@user)
      redirect_to user_path(@user.id), notice: "お友達に登録しました"
      @user
    else
      @user
    end
  end

  def destroy
    @user = FavoriteUser.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to user_path(@user.id), notice: "お友達を解除しました"
    @user
  end
end
