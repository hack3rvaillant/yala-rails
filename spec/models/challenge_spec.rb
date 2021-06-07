require "rails_helper"

RSpec.describe Challenge, type: :model do
  around(:each) do |example|
    ActsAsTenant.with_tenant(create(:community)) do
      example.run
    end
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:language) }
    it { should validate_inclusion_of(:language).in_array Language.all }
    it { should belong_to(:section) }
  end

  describe "has a valid factory" do
    it { expect(build(:challenge)).to be_valid }
  end
end
