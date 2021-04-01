require_relative '../interactions/communities/create.rb'
class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  def new
    @community = CreateCommunityAndFirstUser.new
  end

  def create
    @community = CreateCommunityAndFirstUser.run(params[:community])
    if @community.valid?
      flash[:notice] = "Well done! You are now the administrator of the #{@community.name} Learning Community"
      redirect_to onboarding_path, subdomain: params[:community][:subdomain]
    else
      render :new
    end
  end
end
