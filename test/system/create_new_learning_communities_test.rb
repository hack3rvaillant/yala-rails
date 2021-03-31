require "application_system_test_case"

class CreateNewLearningCommunitiesTest < ApplicationSystemTestCase
  test 'create a learning community' do
    visit root_path
    assert_link text: 'Create my learning community'
    click_on 'Create my learning community'
    assert_title 'Create a new learning community'
    assert_selector 'h1', text: 'Create a new learning community'
    fill_in('community[subdomain]', with: 'douartech')
    fill_in('community[name]', with: 'Douar Tech')
    fill_in('user[firstname]', with: 'Hanae')
    fill_in('user[lastname]', with: 'Bezad')
    click_on 'Create'
  end
end
