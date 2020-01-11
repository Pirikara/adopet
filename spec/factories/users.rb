FactoryBot.define do
  factory :user do
    name                      {"abebe"}
    password                  {"1a1a1a1a"}
    password_confirmation     {"1a1a1a1a"}
    sequence(:email) {Faker::Internet.email}
  end
end