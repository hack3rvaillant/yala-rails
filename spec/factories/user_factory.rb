FactoryBot.define do
  factory :user do
    username { "hanaeB" }
    email { "hanae@douar.tech" }
    password { "p@$$w0rD" }
    community { ActsAsTenant.current_tenant }
  end
end
