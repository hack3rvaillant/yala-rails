# frozen_string_literal: true

require "spec_helper"
require "rails_helper"

RSpec.describe CreateCommunityAndFirstUser do
  context "When all the required arguments are given" do
    let(:params) {
      {
        name: "srta",
        subdomain: "sart",
        username: "sart",
        email: "toto@toto.com",
        password: "satrssrarta"
      }
    }
    let(:result) { described_class.run(params).result }

    let(:returned_user) { result[0] }
    let(:returned_community) { result[1] }
    let(:random_community) { create(:community) }

    it "Is valid" do
      expect(described_class.new(params)).to be_valid
    end

    it "returns an array" do
      expect(result.class).to be Array
    end

    it "returns an array with two elements" do
      expect(result.length).to be 2
    end

    it "returns an array where the first element is a persisted User" do
      expect(returned_user.class).to be User
      expect(returned_user.persisted?).to be true
    end

    it "returns an array where the 2nd element is a persisted Community" do
      expect(result[1].class).to be Community
      expect(result[1].persisted?).to be true
    end

    it "gives an admin role to the user on the community she just created" do
      expect(returned_user.has_role? :admin, returned_community).to be true
    end

    it "does no gives an admin role to the user on another community" do
      expect(returned_user.has_role? :admin, random_community).to be false
    end
  end

  context "When name is missing" do
    it "Is invalid" do
      expect(described_class.new(name: "", subdomain: "sart", username: "sart", email: "toto@toto.com", password: "satrssrarta")).to be_invalid
    end
  end

  context "When subdomain is missing" do
    it "Is invalid" do
      expect(described_class.new(name: "srta", subdomain: "", username: "sart", email: "toto@toto.com", password: "satrssrarta")).to be_invalid
    end
  end

  context "When username is missing" do
    it "Is invalid" do
      expect(described_class.new(name: "srta", subdomain: "sart", username: "", email: "toto@toto.com", password: "satrssrarta")).to be_invalid
    end
  end

  context "When email is missing" do
    it "Is invalid" do
      expect(described_class.new(name: "srta", subdomain: "sart", username: "sart", email: "", password: "satrssrarta")).to be_invalid
    end
  end

  context "When password is missing" do
    it "Is invalid" do
      expect(described_class.new(name: "srta", subdomain: "sart", username: "sart", email: "toto@toto.com", password: "")).to be_invalid
    end
  end

  context "When email is not in the right format" do
    it "Is invalid" do
      expect(described_class.new(name: "srta", subdomain: "sart", username: "sart", email: "sratrs", password: "satrssrarta")).to be_invalid
    end
  end
end
