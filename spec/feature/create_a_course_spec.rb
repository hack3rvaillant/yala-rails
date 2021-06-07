# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Create a course", type: :feature do
  let(:email) { "mohamed@douar.tech" }
  let(:password) { "p@ssw0rd" }
  let(:title) { "Become a web entrepreneur" }
  let(:desc) { "This is a course about the mindset and toolset to become a webentrepreneur" }
  let(:community) { create(:community, slug: "douar") }
  let(:user) { create(:user, community: community, password: password, email: email) }
  let(:first_section_title) { "This is the first section title" }
  let(:second_section_title) { "This is the second section title" }

  context "As a signed in user" do
    describe "I can create a course" do
      it "So I can add sections and challenges to structure the course" do
        ActsAsTenant.with_tenant(community) do
          sign_in(user)
          visit new_community_course_path(community_slug: community.slug)
          expect(page).to have_content("Create a course")

          # Create the course
          fill_in("course[title]", with: title)
          fill_in("course[description]", with: desc)
          click_button
          expect(page).to have_current_path(community_course_path(community_slug: community.slug, id: Course.last.id))
          expect(page).to have_content title
          expect(page).to have_content desc

          # Create first section
          fill_in("course[sections_attributes[][title]]", with: first_section_title)
          click_on "Add a section"
          expect(page).to have_content first_section_title

          # Create second section
          fill_in("course[sections_attributes[][title]]", with: second_section_title)
          click_on "Add a section"
          expect(page).to have_content second_section_title

          # Go to the first section
          sleep 1
          click_on first_section_title
          sleep 1
          expect(page).to have_current_path(
            community_section_path(
              community_slug: community.slug,
              id: Section.first.id
            )
          )

          fill_in("section[challenges_attributes[][title]]", with: "Challenge number one title")
          fill_in("section[challenges_attributes[][description]]", with: "Challenge number one description")
          select "ar", from: "section[challenges_attributes[][language]]"
          click_button

          fill_in("section[challenges_attributes[][title]]", with: "Challenge number two title")
          fill_in("section[challenges_attributes[][description]]", with: "Challenge number two description")
          select "ar", from: "section[challenges_attributes[][language]]"
          click_button

          expect(page).to have_content "Perfect !"
          expect(page).to have_content "Challenge number one title"
          expect(page).to have_content "Challenge number one description"
          expect(page).to have_content "ar"
        end
      end
    end
  end
end
