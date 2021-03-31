require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:username)
    should validate_uniqueness_of(:email).with("sta@douar.tech", "STa@douar.tech")
  end
end
