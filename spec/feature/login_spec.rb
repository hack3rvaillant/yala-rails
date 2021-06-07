# frozen_string_literal: true

require "spec_helper"
require "rails_helper"

RSpec.describe "Login", type: :feature do
  let(:email) { "mohamed@douar.tech" }
  let(:password) { "p@ssw0rd" }
  let(:wrong_password) { "p@ssw0rd!" }
  let(:community) { create(:community, slug: "douar") }
  let!(:user) { create(:user, community: community, password: password, email: email) }

  context "As a signed up user" do
    describe "I can  Login to my learning Community" do
      it "So that I can start my learning journey" do
        visit community_path(community)
        click_on "Login"
        expect(page).to have_current_path(community_login_path(community_slug: community.slug))
        fill_in "Email", with: email
        fill_in "Password", with: password
        click_button

        expect(page).to have_title "Profile"
      end
    end

    describe "I can have feedback when I type a wrong password" do
      it "So that I can correct myself" do
        visit community_path(community)
        click_on "Login"
        expect(page).to have_current_path(community_login_path(community_slug: community.slug))
        fill_in "Email", with: email
        fill_in "Password", with: wrong_password
        click_button
        expect(page).to have_content("Invalid Email or password.")
      end
    end
  end
end
