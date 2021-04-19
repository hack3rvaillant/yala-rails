# frozen_string_literal: true

require "spec_helper"
require "rails_helper"

RSpec.describe "Redirect to admin after community created", type: :feature do
  context "As a First Time Visitor" do
    let(:slug) { "douar" }
    describe "I can create my own Learning Community" do
      it "So that I become the administrator" do
        visit "/"
        click_on "Create my learning community"
        fill_in "community[name]", with: "Douar Tech"
        fill_in "community[slug]", with: slug
        fill_in "community[email]", with: "hanae@douar.tech"
        fill_in "community[username]", with: "hanaeB"
        fill_in "community[password]", with: "p@$$w0rd"
        click_on "Create"
        expect(page).to have_content("Douar Tech Learning Community")
        expect(page).to have_title "Admin"
      end
    end
  end
end
