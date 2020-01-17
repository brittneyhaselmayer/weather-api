# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(username: "Mei", password: "1234")
user2 = User.create(username: "Brittney", password: "1234")


location1 = FavouriteLocation.create(zipcode: "78717", user_id: user1.id)
location2 = FavouriteLocation.create(zipcode: "78704", user_id: user2.id)






