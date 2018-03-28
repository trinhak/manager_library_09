# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Example User",
  email: "example@railstutorial.org",
  password: "123123",
  password_confirmation: "123123",
  admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password)
end


2.times do |n|
  Category.create!(name: Faker::Name.name)
end

2.times do |n|
  Author.create!(
    name: Faker::Name.name,
    birthday: Faker::Date.between(10.days.ago, Date.today),
    details: Faker::Name.name 
  )
end

cate_rand = Category.all.pluck(:id)

Author.all.each do |author|
  author.books.create!(
    name: Faker::Name.name,
    category_id: cate_rand[rand(cate_rand.size)],
    publisher: Faker::Name.name,
    description: Faker::Lorem.sentence(2),
    quantity: 20
  )
end
