# frozen_string_literal: true

require "spec_helper"
require "rails_helper"

RSpec.describe "Onboarding", type: :feature do
  context "As a First Time Visitor" do
    describe "I can create my own Learning Community" do
      within_subdomain("douar") do
        it "So that I become the administrator" do
          visit "/"
          click_on "Create my learning community"
          fill_in "community[name]", with: "Douar Tech"
          fill_in "community[subdomain]", with: "douar"
          fill_in "community[email]", with: "hanae@douar.tech"
          fill_in "community[username]", with: "hanaeB"
          fill_in "community[password]", with: "p@$$w0rd"
          click_on "Create"
          expect(page).to have_content(
            "Well done! You are now the administrator of the"\
            " Douar Tech Learning Community"
          )
          expect(page).to have_title "Onboarding"
        end
      end
    end
  end
end
