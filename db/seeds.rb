# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "sunny", email:"sunny@ptotem.com", password: "password", password_confirmation: "password")

Theme.create!(name: "Surprise", color: "#F5B7B1", icon: "ion-star")
Theme.create!(name: "Party", color: "#5DADE2", icon: "ion-balloon")
Theme.create!(name: "Adventurous", color: "#82E0AA", icon: "ion-happy-outline")
Theme.create!(name: "Sadness", color: "#D4E6F1", icon: "ion-sad-outline")
Theme.create!(name: "Anger", color: "#EC407A", icon: "ion-star")