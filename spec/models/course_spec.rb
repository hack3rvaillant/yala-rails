require "rails_helper"

RSpec.describe Course, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should belong_to(:author) }
  it { should belong_to(:community) }
  it { should have_many(:sections) }

  describe "has a valid factory" do
    it "has a valid factory" do
      ActsAsTenant.with_tenant(create(:community)) do
        expect(build(:course)).to be_valid
      end
    end
  end
end
