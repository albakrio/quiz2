FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| Faker::Internet.email.sub("@", "-#{n}@") }
    password { "wew" }
  end
end
