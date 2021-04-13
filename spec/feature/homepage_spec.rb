# frozen_string_literal: true

require "spec_helper"
require "rails_helper"

RSpec.describe "Homepage" do
  context "As a First Time Visitor" do
    describe "I can visit the homepage" do
      it "So that I can discover the value proposition" do
        visit "/"

        expect(page).to have_selector "h2", text: "A safe place for your community to grow and learn together"
        meta_description =
          Nokogiri::HTML(page.source).css("meta[name='description']")[0]
            .attributes["content"].value
        expect(meta_description).to eq "A safe place for your community to grow and learn together." \
          " Your Awesome Learning Adventure just starts here"
      end
    end
  end
end
