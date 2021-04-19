# frozen_string_literal: true

FactoryBot.define do
  factory :community do
    name { "Douar Tech" }
    slug { "douartech" }
    sequence(:custom_domain) { |n| "example#{n}.com" }
  end
end
