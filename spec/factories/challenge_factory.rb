FactoryBot.define do
  factory :challenge do
    association :section
    title { "MyString" }
    description { "MyText" }
    video_url { "MyString" }
    transcript { "MyText" }
    language { Language.all.sample }
  end
end
