# frozen_string_literal: true

class OnboardingController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @community = current_tenant
    @user = current_tenant.users.first
  end
end
