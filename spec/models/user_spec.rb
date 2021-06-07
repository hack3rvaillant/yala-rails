# frozen_string_literal: true

require "spec_helper"
require "rails_helper"

RSpec.describe User do
  around(:each) do |example|
    ActsAsTenant.with_tenant(create(:community)) do
      example.run
    end
  end

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    it "password with 7 characters should be invalid" do
      expect(build(:user, password: "1" * 7)).to be_invalid
    end

    it "password with 8 characters should be valid" do
      expect(build(:user, password: "1" * 8)).to be_valid
    end

    it "password with 129 characters should be invalid" do
      expect(build(:user, password: "1" * 129)).to be_invalid
    end

    it "password with 128 characters should be valid" do
      expect(build(:user, password: "1" * 128)).to be_valid
    end

    context "When a user has an account with the same email on another community" do
      let(:other_community) { create(:community, id: 42, slug: "douar", name: "Douar Tech") }
      let(:current_community) { create(:community, id: 43, slug: "hameauxlegers", name: "Hameaux Légers") }
      let(:user) { create(:user, email: "same@email.com", community: ActsAsTenant.current_tenant) }
      it "should be valid" do
        ActsAsTenant.with_tenant(other_community) do
          user
        end
        ActsAsTenant.with_tenant(current_community) do
          expect(build(:user, email: "same@email.com", community: current_community)).to be_valid
        end
      end
    end

    context "When a user has an account with the same email within the same community" do
      let(:same_community) { create(:community, id: 42, slug: "douar", name: "Douar Tech") }
      let(:user) { create(:user, email: "same@email.com", community: ActsAsTenant.current_tenant) }
      it "should be valid" do
        ActsAsTenant.with_tenant(same_community) do
          user
          expect(build(:user, email: "same@email.com", community: same_community)).to be_invalid
        end
      end
    end
  end

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end
end
