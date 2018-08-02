class CirclesController < ApplicationController
  before_action :set_circle, only: %i[show edit update destroy]
  before_action :force_top

  def new
    @circle = Circle.new
  end

  def create
    @circle = current_user.circles.build(circle_params)
    if @circle.save
      circlemember = current_user.circle_members.create(circle_id: @circle.id)
      redirect_to circle_path(@circle.id), notice: 'サークルを作成しました'
    else
      render :new
    end
  end

  def show
    @circlemember = current_user.circle_members.find_by(circle_id: @circle.id)
  end

  def edit
  end

  def update
    if @circle.update(circle_params)
      redirect_to circle_path(@circle.id)
    else
      render :edit
    end
  end

  def index
    @search = Circle.search(params[:q])
    @search_circles = @search.result.includes(:user, :circle_members)

    if @search_circles.nil?
      @circles = Circle.all
    else
      @circles = @search_circles
    end
  end

  def destroy
    @circle.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def circle_params
    params.require(:circle).permit(:circle_content,:circle_name,:circle_image)
  end

  def set_circle
    @circle = Circle.find(params[:id])
  end
end
