# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Community do
  it { should validate_presence_of(:subdomain) }
  it { should validate_exclusion_of(:subdomain).in_array Subdomain::BLACKLIST }
  it { should validate_presence_of(:name) }
  it { should have_many(:users) }

  describe 'has a valid factory' do
    it { expect(build(:community)).to be_valid }
  end

  context 'When then subdomain is blacklisted' do
    describe 'It is invalid' do
      it { expect(build(:community, subdomain: 'www')).to be_invalid }
    end
  end
end
