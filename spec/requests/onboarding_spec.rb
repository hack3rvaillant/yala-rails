# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Onboardings', type: :request do
  describe 'GET /index' do
    within_subdomain('douar') do
      it 'returns http success' do
        community = create(:community, subdomain: 'douar')
        ActsAsTenant.test_tenant = community
        create(:user, community: community)
        get '/onboarding'
        expect(response).to have_http_status(:success)
      end
    end
  end
end
