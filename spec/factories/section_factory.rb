FactoryBot.define do
  factory :section do
    title { "MyString" }
    association :course
  end
end
