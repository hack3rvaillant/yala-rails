FactoryBot.define do
  factory :user do
    username { 'hanaeB' }
    email { 'hanae@douar.tech' }
    password { 'p@$$w0rD' }
    association :community
  end
end
