class SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_section, only: %i[show update]

  def show
  end

  def update
    if @section.update(section_params)
      flash.notice = "Perfect !"
    else
      flash.alert = "Something wrong"
    end
    render :show
  end

  private

  def section_params
    params.require(:section).permit(
      :id,
      :title,
      challenges_attributes: %i[title description video_url language]
    )
  end

  def set_section
    @section = Section.includes(:challenges).find(params[:id])
  end
end
