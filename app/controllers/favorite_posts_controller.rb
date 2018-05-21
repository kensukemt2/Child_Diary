class FavoritePostsController < ApplicationController
  def create
    favorite_post = current_user.favorite_posts.create(post_id: params[:post_id])
    redirect_to user_path(current_user.id),notice: "いいね！！しました"
  end
  def destroy
    favorite_post = current_user.favorite_posts.find_by(post_id: params[:post_id]).destroy
    redirect_to user_path(current_user.id),notice: "いいね！！解除しました"
  end
end
