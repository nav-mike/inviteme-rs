# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

team = Team.create(name: "Admins")
user = User.create email: 'm.navrotskiy@gmail.com', password: '12345678', password_confirmation: '12345678', current_team: team
user.add_role :admin
user.panel_teams << team
