# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Onboardings', type: :request do
  describe 'GET /index' do
    let(:community) { create(:community) }
    it 'returns http success' do
      get '/onboarding', params: { subdomain: 'douartech' }
      expect(response).to have_http_status(:success)
    end
  end
end
