class ApplicationController < ActionController::Base
  set_current_tenant_through_filter
  before_action :find_and_set_current_tenant

  include Pundit
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username])
  end

  private

  def find_and_set_current_tenant
    current_community = Community.find_by(slug: slug_params)
    raise NoTenantSet, "You must set a community first" unless current_community

    set_current_tenant(current_community)
  end

  def slug_params
    params[:controller] == "communities" ? params[:slug] : params[:community_slug]
  end
end
