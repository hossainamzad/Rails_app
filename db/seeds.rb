# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# User.create ([{username: "Horatio", fname: "Horatio", lname: "vaat", email: ""}])

Post.delete_all
User.delete_all
Comment.delete_all

users = []
10.times do
	users << User.create(username: Faker::Name.name, fname: Faker::Name.first_name,lname: Faker::Name.last_name, email: Faker::Internet.email)
end

posts = []
10.times do
	posts << Post.create(body: Faker::Lorem.paragraph, user_id: users.sample.id, title: Faker::Lorem.sentence)
end

10.times do
Comment.create(body: Faker::Lorem.sentence, user_id: users.sample.id, post_id: posts.sample.id)
end