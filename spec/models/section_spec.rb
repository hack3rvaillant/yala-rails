require "rails_helper"

RSpec.describe Section, type: :model do
  around(:each) do |example|
    ActsAsTenant.with_tenant(create(:community)) do
      example.run
    end
  end
  describe "has a valid factory" do
    it { expect(build(:section)).to be_valid }
  end
end
