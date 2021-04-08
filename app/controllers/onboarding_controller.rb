# frozen_string_literal: true

class OnboardingController < TenantController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @community = ActsAsTenant.current_tenant
    @user = @community.users.first
    @user
  end
end
