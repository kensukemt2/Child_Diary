class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def force_top
    if current_user.nil?
      redirect_to root_path, notice: "ログインしてください"
    end
  end
end
