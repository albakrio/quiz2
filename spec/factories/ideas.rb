FactoryBot.define do

  factory :idea do
    title { Faker::Job.title }
    body { Faker::Lorem.words(number: 50) }

    association(:user, factory: :user)
  end
end
