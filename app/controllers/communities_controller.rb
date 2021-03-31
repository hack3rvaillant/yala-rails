class CommunitiesController < ApplicationController
  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      redirect_to onboarding_path
    else
      render :new
    end
  end

  private

  def community_params
    params.require(:community).permit(%i[name subdomain])
  end
end
