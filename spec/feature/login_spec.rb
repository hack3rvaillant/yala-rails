# frozen_string_literal: true

require "spec_helper"
require "rails_helper"

RSpec.describe "Login", type: :feature do
  let(:slug) { "douar" }
  let(:community) { create(:community, slug: slug) }
  let!(:user) { create(:user, community: community, password: "p@$$w0rd", email: "fay@douar.tech") }

  context "As a signed up user" do
    describe "I can  Login to my learning Community" do
      it "So that I can start my learning journey" do
        visit community_path(community)
        click_on "Login"
        expect(page).to have_current_path(community_login_path(community_slug: community.slug))
        fill_in "Email", with: "fay@douar.tech"
        fill_in "Password", with: "p@$$w0rd"
        click_button

        expect(page).to have_title "Profile"
      end
    end
  end
end
