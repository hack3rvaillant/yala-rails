require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get the homepage' do
    get pages_home_url
    assert_response :success
  end
end
