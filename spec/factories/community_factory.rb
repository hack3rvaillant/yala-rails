# frozen_string_literal: true

FactoryBot.define do
  factory :community do
    name { "Douar Tech" }
    subdomain { "douartech" }
    sequence(:domain) { |n| "example#{n}.com" }
  end
end
