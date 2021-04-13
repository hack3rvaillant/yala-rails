# frozen_string_literal: true

require "rails_helper"

RSpec.describe "About" do
  context "As a Visitor" do
    describe "I can visit the about page" do
      it "So that I can discover more about the Yala project" do
        visit "/"
        click_on("About")
        expect(page).to have_content("This project is awesome if you want to build a strong community.")
        expect(page).to have_content(" Just give it a try or book a call with our team")
      end
    end
  end
end
