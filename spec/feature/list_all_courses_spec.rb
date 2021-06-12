# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe "ListAllCourses", type: :feature do
  let(:community) { create(:community, slug: "douar") }
  let(:user) { create(:user, community: community) }  
  let(:author) { create(:user, email: "mohamed@dour.tech", community: community) }
  let(:course_title_1) { "First Course Title" }
  let(:course_title_2) { "Another Course" }
  let(:course_title_3) { "And the last Course" }

  context "When no course is created" do
    it 'displays an empty state with a call to action' do
      login_as user
      visit 'communities/douar/courses'
      expect(page).to have_content("No courses created yet")
      expect(page).to have_content("Create the first course !")
    end
  end

  context "When 3 courses are created" do
    let!(:course1) { create(:course, author: author, title: course_title_1, community: community)}
    let!(:course2) { create(:course, author: author, title: course_title_2, community: community)}
    let!(:course3) { create(:course, author: author,title: course_title_3, community: community)}
    it 'list all the 3 courses' do
      login_as user
      visit 'communities/douar/courses'
      expect(page).to have_content(course_title_1)
      expect(page).to have_content(course_title_2)
      expect(page).to have_content(course_title_3)
    end
  end
end
