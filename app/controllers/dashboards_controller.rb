# frozen_string_literal: true

class DashboardsController < TenantController
  skip_before_action :authenticate_user!, only: %i[admin]

  def admin
    @community = ActsAsTenant.current_tenant
    @user = @community.users.first
    @user
  end
end
