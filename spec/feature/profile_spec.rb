# frozen_string_literal: true

require "spec_helper"
require "rails_helper"

RSpec.describe "Profile", type: :feature do
  let(:email) { "mohamed@douar.tech" }
  let(:password) { "p@ssw0rd" }
  let(:community) { create(:community, slug: "douar") }
  let!(:user) { create(:user, community: community, password: password, email: email) }

  context "As a signed out user" do
    describe "I cannot see the Profile link" do
      it "So that I have to login first" do
        visit community_path(community)
        expect(page).not_to have_content("Profile")
      end
    end
  end
  context "As a signed in user" do
    describe "I can go to my profile page" do
      it "So that I can see my informations" do
        sign_in(user)
        visit community_path(community)
        expect(page).to have_content("Profile")
        click_on "Profile"
        expect(page).to have_current_path(community_profile_path(community_slug: community.slug))
        fill_in "Email", with: email
        fill_in "Password", with: password
        click_button

        expect(page).to have_title "Profile"
      end
    end
  end
end
