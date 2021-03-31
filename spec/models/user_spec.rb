# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'has a valid factory' do
    it { expect(build(:user)).to be_valid }
  end
end
