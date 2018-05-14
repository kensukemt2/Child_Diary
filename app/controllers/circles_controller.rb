class CirclesController < ApplicationController
  before_action :set_circle, only: %i[show edit update]
  before_action :force_top
  def new
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(circle_params)
    @circle.user_id = current_user.id
    if @circle.save
      redirect_to circle_path(Circle.id), notice: "サークルを作成しました"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @circle.update
      redirect_to circle_path(Circle.id)
    else
      render 'edit'
    end
  end

  def index
    @circles = Circle.all
  end

  private

  def circle_params
    params.require(:circle).permit(:circle_content,:circle_name)
  end

  def set_circle
    @circle = Circle.find(params[:id])
  end
end
