FactoryBot.define do
  factory :course do
    title { "MyString" }
    description { "MyText" }
    association :author, factory: :user
  end
end
