require 'application_system_test_case'
require 'test_helper'

module HomepageTest
  class AsAVisitor < ApplicationSystemTestCase
    test 'visiting the index' do
      visit root_path

      assert_selector 'h1', text: 'Yala'
      assert_title 'YalaRails'
    end
  end
  class AsAUser < ApplicationSystemTestCase
    test 'visiting the index' do
      visit root_path

      assert_selector 'h1', text: 'Yala'
      assert_title 'YalaRails'
    end
  end
end
