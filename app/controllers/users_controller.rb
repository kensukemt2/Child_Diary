class UsersController < ApplicationController
  before_action :force_top, only: :show
  before_action :set_user, only: %i[show edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: 'ユーザー登録完了しました'
    else
      render 'new'
    end
  end

  def show
    @posts = @user.posts.limit(5).order('id DESC')
    @born_from = Time.zone.today - @user.birthday
  end

  def edit; end

  def update
    if @user.update(user_edit_params)
      redirect_to user_path(@user), notice: 'ユーザー情報を編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'ユーザー情報を削除しました'
  end

  private
  def user_params
    params.require(:user).permit(
      :name, :email, :password, :child_name, :comment, :birthday,
      :image, :image_cache
    )
  end

  def user_edit_params
    params.require(:user).permit(
      :name, :email, :child_name, :comment, :birthday, :image, :image_cache
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
