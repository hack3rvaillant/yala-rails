require_relative "../interactions/create_community_and_first_user"
class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  def new
    @community = CreateCommunityAndFirstUser.new
  end

  def create
    @community = CreateCommunityAndFirstUser.run(params[:community])
    if @community.valid?
      flash[:notice] = "Well done! You are now the administrator of the #{@community.name} Learning Community"
      redirect_to onboarding_url(subdomain: @community.community.subdomain)

      # Needed because Capybara doesn't work well with subdomains and redirections
      Capybara.default_host = "http://#{@community.community.subdomain}.lvh.me" if Rails.env.test?
    else
      render :new
    end
  end
end
