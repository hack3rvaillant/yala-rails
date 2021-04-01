# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe CreateCommunityAndFirstUser do
  context 'When all the required arguments are given' do
    it 'Is valid' do
      expect(described_class.new(name: 'srta', subdomain: 'sart', username: 'sart', email: 'toto@toto.com', password: 'satrssrarta')).to be_valid
    end
  end

  context 'When name is missing' do
    it 'Is invalid' do
      expect(described_class.new(name: '', subdomain: 'sart', username: 'sart', email: 'toto@toto.com', password: 'satrssrarta')).to be_invalid
    end
  end

  context 'When subdomain is missing' do
    it 'Is invalid' do
      expect(described_class.new(name: 'srta', subdomain: '', username: 'sart', email: 'toto@toto.com', password: 'satrssrarta')).to be_invalid
    end
  end

  context 'When username is missing' do
    it 'Is invalid' do
      expect(described_class.new(name: 'srta', subdomain: 'sart', username: '', email: 'toto@toto.com', password: 'satrssrarta')).to be_invalid
    end
  end

  context 'When email is missing' do
    it 'Is invalid' do
      expect(described_class.new(name: 'srta', subdomain: 'sart', username: 'sart', email: '', password: 'satrssrarta')).to be_invalid
    end
  end

  context 'When password is missing' do
    it 'Is invalid' do
      expect(described_class.new(name: 'srta', subdomain: 'sart', username: 'sart', email: 'toto@toto.com', password: '')).to be_invalid
    end
  end

  context 'When email is not in the right format' do
    it 'Is invalid' do
      expect(described_class.new(name: 'srta', subdomain: 'sart', username: 'sart', email: 'sratrs', password: 'satrssrarta')).to be_invalid
    end
  end

  context 'When email is already taken' do
    let!(:user) { create(:user) }
    it 'Is invalid' do
      interaction = described_class.run(name: 'srta', subdomain: 'sart', username: 'sart', email: user.email, password: 'satrssrta')
      expect(interaction.errors.messages[:email]).to eq ["is already taken"]
      expect(interaction).to be_invalid
    end
  end
end
