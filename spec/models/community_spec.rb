# frozen_string_literal: true

require "rails_helper"

RSpec.describe Community do
  it { should validate_presence_of(:slug) }
  it { should validate_exclusion_of(:slug).in_array Slug.forbidden }
  it { should validate_presence_of(:name) }
  it { should have_many(:users) }

  describe "has a valid factory" do
    it { expect(build(:community)).to be_valid }
  end

  context "When then slug is blacklisted" do
    describe "It is invalid" do
      it { expect(build(:community, slug: "www")).to be_invalid }
    end
  end
end
