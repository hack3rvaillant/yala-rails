class CoursesController < ApplicationController
  before_action :set_course, only: %i[show update]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params.merge(author: current_user))
    if @course.save
      redirect_to community_course_path(ActsAsTenant.current_tenant, @course)
    else
      render :new
    end
  end

  def show
  end

  def update
    if @course.update(course_params)
      flash.now.notice = "Great!"
    else
      flash.now.alert = "Something went wrong"
    end
    render :show
  end

  private

  def course_params
    params.require(:course).permit(
      :id,
      :title,
      :description,
      sections_attributes: %i[title]
    )
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
