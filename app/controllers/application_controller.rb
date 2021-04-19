class ApplicationController < ActionController::Base
  set_current_tenant_by_subdomain_or_domain(:community, :subdomain, :domain)

  include Pundit
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[firstname lastname])
  end
end
