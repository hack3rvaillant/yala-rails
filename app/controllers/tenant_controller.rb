class TenantController < ApplicationController
  # set_current_tenant_by_subdomain_or_domain(:community, :subdomain, :domain)

  set_current_tenant_through_filter
  before_action :find_community

  def find_community
    subdomain = request.subdomains.last
    subquery = subdomain.present? ? {subdomain: subdomain&.downcase} : {domain: request.domain&.downcase}
    tenant = Community.where(subquery).first
    tenant = Community.last if Rails.env.test? && tenant.nil?
    set_current_tenant(tenant)
  end
end
