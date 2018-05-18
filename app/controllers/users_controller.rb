class UsersController < ApplicationController
  before_action :force_top, only: :show
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: "ユーザー登録完了しました"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.limit(5).order('id DESC')
    @born_from =  Time.zone.today - @user.birthday
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :child_name, :comment,
       :birthday, :image, :image_cache)
  end
end
