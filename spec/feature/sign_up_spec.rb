# frozen_string_literal: true

require "spec_helper"
require "rails_helper"

RSpec.describe "Sign Up", type: :feature do
  let(:slug) { "douar" }
  let(:community) { create(:community, slug: slug) }

  context "As a First Time Visitor" do
    describe "I can  Sign Up to my learning Community" do
      it "So that I update my profile" do
        visit community_path(community)
        click_on "Sign Up"
        expect(page).to have_current_path(community_sign_up_path(community_slug: community.slug))
        fill_in "Username", with: "fayC"
        fill_in "Email", with: "fay@douar.tech"
        fill_in "Password", with: "p@$$w0rd"
        fill_in "Password Confirmation", with: "p@$$w0rd"
        click_button

        expect(page).to have_title "Profile"
      end
    end
  end
end
