# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    it 'password with 7 characters should be invalid' do
      expect(build(:user, password: '1' * 7)).to be_invalid
    end

    it 'password with 8 characters should be valid' do
      expect(build(:user, password: '1'* 8)).to be_valid
    end

    it 'password with 129 characters should be invalid' do
      expect(build(:user, password: '1' * 129)).to be_invalid
    end

    it 'password with 128 characters should be valid' do
      expect(build(:user, password: '1' * 128)).to be_valid
    end

    context 'When a user has an account with the same email on another community' do
      let!(:other_community) { create(:community, id: 42, subdomain: 'douartech') }
      let!(:user) { create(:user, email: 'same@email.com', community: other_community) }
      let!(:current_community) { create(:community, id: 43, subdomain: 'hameauxlegers' ) }
      it 'should be valid' do
        binding.pry
        expect(build(:user, email: 'same@email.com', community: current_community)).to be_valid
      end
    end
  end

  describe 'has a valid factory' do
    it { expect(build(:user)).to be_valid }
  end
end
