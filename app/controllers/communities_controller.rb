# require_relative "../interactions/create_community_and_first_user"
class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create show]
  skip_before_action :find_and_set_current_tenant, only: %i[new create]

  before_action :set_community, only: %i[show update edit]
  layout "application", only: %i[new create]

  def new
    @community_and_admin = CreateCommunityAndAdmin.new
  end

  def create
    @community_and_admin = CreateCommunityAndAdmin.run(params[:community])
    if @community_and_admin.valid?
      sign_in(@community_and_admin.user)
      redirect_to edit_community_path(@community_and_admin.community)
    else
      render :new
    end
  end

  def show
    @community = ActsAsTenant.current_tenant
  end

  def edit
  end

  def update
    if @community.update(community_params)
      redirect_to community_path(@community)
    else
      render :edit
    end
  end

  private

  def set_community
    @community = ActsAsTenant.current_tenant
  end

  def community_params
    params.require(:community).permit(%i[custom_domain slug name])
  end
end
