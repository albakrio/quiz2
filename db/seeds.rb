# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NUM_IDEAS = 25

Like.delete_all
Review.delete_all
Idea.delete_all
User.delete_all

PASSWORD = "omar123"

25.times do
  name = Faker::Name.name
  User.create(
    name: name,
    email: "#{name.downcase}@#{Faker::Movies::LordOfTheRings.location}.com",
    password: PASSWORD
  )
end

users = User.all

NUM_IDEAS.times do
  created_at = Faker::Date.backward(days: 365)
  q = Idea.create(
    # Faker is a ruby module. We access classes or
    # other modules inside of a module with the
    # `::` syntax. Here Hacker is a class within
    # the Faker module.
    title: Faker::Hacker.say_something_smart,
    body: Faker::ChuckNorris.fact,
    created_at: created_at,
    updated_at: created_at,
    user: users.sample
  )
  if q.valid?
    q.reviews = rand(0..15).times.map do
      Review.new(
        body: Faker::GreekPhilosophers.quote,
        user: users.sample
      )
    end
    q.likers = users.shuffle.slice(0, rand(users.count))
  end
end

idea = Idea.all

