# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Erasing data...'
puts ''
Book.destroy_all
User.destroy_all

puts 'Creating books...'
puts ''

10.times.each do
  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    description: Faker::Lorem.paragraph(sentence_count: 50),
    category: Book::CATEGORIES.sample
  )
end

puts 'Creating users...'
puts ''

4.times.each do
  User.create(
    full_name: Faker::Name.name,
    email: Faker::Internet.email,
    address: Faker::Address.street_name,
    age: rand(18..70),
    gender: ['Male', 'Female'].sample
  )
end

puts '...Done!'
